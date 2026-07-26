//
//  AppAuthDataRepository.swift
//  farmedev
//

import Foundation

final class AppAuthDataRepository: AppAuthRepository {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClientFactory.shared.client) {
        self.apiClient = apiClient
    }

    func register(email: String, password: String, fullName: String, surname: String) async throws -> AuthUser {
        struct Body: Encodable { let email, password, fullName, surname: String }
        let body = try JSONEncoder().encode(Body(email: email, password: password, fullName: fullName, surname: surname))
        let session: AuthSessionDTO = try await apiClient.request(path: "auth/register", method: .post, body: body, queryItems: nil)
        persistSession(session)
        return session.user.toDomain()
    }

    func login(email: String, password: String) async throws -> AuthUser {
        struct Body: Encodable { let email, password: String }
        let body = try JSONEncoder().encode(Body(email: email, password: password))
        let session: AuthSessionDTO = try await apiClient.request(path: "auth/login", method: .post, body: body, queryItems: nil)
        persistSession(session)
        return session.user.toDomain()
    }

    func logout() async {
        if let refreshToken = SessionStore.loadRefreshToken() {
            struct Body: Encodable { let refreshToken: String }
            let body = try? JSONEncoder().encode(Body(refreshToken: refreshToken))
            _ = try? await apiClient.requestVoid(path: "auth/logout", method: .post, body: body, queryItems: nil)
        }
        apiClient.setAuthToken(nil)
        SessionStore.clear()
    }

    func me() async throws -> AuthUser {
        let dto: AuthUserDTO = try await apiClient.request(path: "users/me", method: .get, body: nil, queryItems: nil)
        return dto.toDomain()
    }

    func updateProfile(fullName: String?, surname: String?, phone: String?) async throws -> AuthUser {
        struct Body: Encodable { let fullName, surname, phone: String? }
        let body = try JSONEncoder().encode(Body(fullName: fullName, surname: surname, phone: phone))
        let dto: AuthUserDTO = try await apiClient.request(path: "users/me", method: .patch, body: body, queryItems: nil)
        let user = dto.toDomain()
        SessionStore.saveProfile(CachedProfile(email: user.email, fullName: user.fullName, surname: user.surname))
        return user
    }

    func forgotPassword(email: String) async throws -> String? {
        struct Body: Encodable { let email: String }
        let body = try JSONEncoder().encode(Body(email: email))
        let response: ForgotPasswordResponseDTO = try await apiClient.request(path: "auth/forgot-password", method: .post, body: body, queryItems: nil)
        return response.resetToken
    }

    func resetPassword(resetToken: String, newPassword: String) async throws {
        struct Body: Encodable { let resetToken, newPassword: String }
        let body = try JSONEncoder().encode(Body(resetToken: resetToken, newPassword: newPassword))
        try await apiClient.requestVoid(path: "auth/reset-password", method: .post, body: body, queryItems: nil)
    }

    func changePassword(currentPassword: String, newPassword: String) async throws {
        struct Body: Encodable { let currentPassword, newPassword: String }
        let body = try JSONEncoder().encode(Body(currentPassword: currentPassword, newPassword: newPassword))
        try await apiClient.requestVoid(path: "auth/change-password", method: .patch, body: body, queryItems: nil)
    }

    // MARK: - Private

    private func persistSession(_ session: AuthSessionDTO) {
        SessionStore.saveTokens(access: session.accessToken, refresh: session.refreshToken)
        apiClient.setAuthToken(session.accessToken)
        let user = session.user.toDomain()
        SessionStore.saveProfile(CachedProfile(email: user.email, fullName: user.fullName, surname: user.surname))
    }
}
