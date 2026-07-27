//
//  AppState.swift
//  farmedev
//

import Foundation

@Observable
final class AppState: AuthSessionProviding {
    var isLoggedIn: Bool = false
    var currentUserId: String?
    var userDisplayName: String = "Invitado"
    var userFullName: String = ""
    var userSurname: String = ""
    var userEmail: String = ""
    var defaultAddress: String = "Selecciona una dirección"
    var cartCount: Int = 0
    var authErrorMessage: String?

    /// Contextual login gate for guest browsing (section 2.8.1): screens that require an
    /// account call `requireAuth(action:)` instead of assuming `isLoggedIn` is already true.
    var isPresentingLoginGate: Bool = false
    private var pendingGateAction: (() -> Void)?

    private let authUseCase: AppAuthUseCase

    init(authUseCase: AppAuthUseCase = AppAuthUseCase()) {
        self.authUseCase = authUseCase
        APIClientFactory.shared.interceptor.onRefreshFailed = { [weak self] in
            Task { @MainActor in self?.forceLogout() }
        }
        CurrentSession.provider = self
        restoreSession()
    }

    // MARK: - Auth

    func login(email: String, password: String) async throws {
        authErrorMessage = nil
        do {
            let user = try await authUseCase.login(email: email, password: password)
            applyUser(user)
            isLoggedIn = true
            await MergeGuestCartUseCase().execute()
        } catch {
            authErrorMessage = Self.friendlyMessage(for: error)
            throw error
        }
    }

    func register(email: String, password: String, fullName: String, surname: String) async throws {
        authErrorMessage = nil
        do {
            let user = try await authUseCase.register(email: email, password: password, fullName: fullName, surname: surname)
            applyUser(user)
            isLoggedIn = true
            await MergeGuestCartUseCase().execute()
        } catch {
            authErrorMessage = Self.friendlyMessage(for: error)
            throw error
        }
    }

    func logout() async {
        await authUseCase.logout()
        forceLogout()
    }

    func setCartCount(_ count: Int) {
        cartCount = count
    }

    func applyUpdatedProfile(fullName: String, surname: String) {
        userFullName = fullName
        userSurname = surname
        userDisplayName = fullName.isEmpty ? "Usuario" : fullName
        SessionStore.saveProfile(CachedProfile(email: userEmail, fullName: fullName, surname: surname))
    }

    // MARK: - Contextual auth gate

    func requireAuth(action: @escaping () -> Void) {
        if isLoggedIn {
            action()
        } else {
            pendingGateAction = action
            isPresentingLoginGate = true
        }
    }

    func authGateDidSucceed() {
        isPresentingLoginGate = false
        let action = pendingGateAction
        pendingGateAction = nil
        action?()
    }

    func authGateDidCancel() {
        isPresentingLoginGate = false
        pendingGateAction = nil
    }

    // MARK: - Private

    private func restoreSession() {
        guard SessionStore.hasSession, let cached = SessionStore.loadProfile() else { return }
        userDisplayName = cached.fullName.isEmpty ? "Usuario" : cached.fullName
        userFullName = cached.fullName
        userSurname = cached.surname
        userEmail = cached.email
        isLoggedIn = true

        Task {
            do {
                let user = try await authUseCase.me()
                applyUser(user)
            } catch {
                forceLogout()
            }
        }
    }

    private func forceLogout() {
        SessionStore.clear()
        APIClientFactory.shared.client.setAuthToken(nil)
        try? CartLocalDataStore().deleteAll()
        isLoggedIn = false
        currentUserId = nil
        userDisplayName = "Invitado"
        userFullName = ""
        userSurname = ""
        userEmail = ""
        cartCount = 0
    }

    private func applyUser(_ user: AuthUser) {
        currentUserId = user.id
        userEmail = user.email
        userFullName = user.fullName
        userSurname = user.surname
        userDisplayName = user.fullName.isEmpty ? "Usuario" : user.fullName
    }

    private static func friendlyMessage(for error: Error) -> String {
        if case let .server(_, message) = error as? APIError {
            return message
        }
        return "No se pudo completar la solicitud. Intenta nuevamente."
    }
}
