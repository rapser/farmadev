//
//  AppState.swift
//  farmedev
//

import Foundation

@Observable
final class AppState {
    var isLoggedIn: Bool = false
    var userDisplayName: String = "Miguel"
    var userFullName: String = "Miguel Angel"
    var userSurname: String = "Tomairo Mendez"
    var defaultAddress: String = "Jirón Pedro Villalobos 1118"
    var cartCount: Int = 0

    init() {
        restoreSession()
    }

    func login(email: String) {
        applyUser(displayName: extractName(from: email))
        isLoggedIn = true
        SessionStore.save(email: email)
    }

    func loginWithSocial(provider: String) {
        applyUser(displayName: "Miguel")
        isLoggedIn = true
        SessionStore.save(email: "social:\(provider)")
    }

    func logout() {
        isLoggedIn = false
        SessionStore.clear()
    }

    // MARK: - Private

    private func restoreSession() {
        guard let stored = SessionStore.load() else { return }
        let name = stored.hasPrefix("social:") ? "Miguel" : extractName(from: stored)
        applyUser(displayName: name)
        isLoggedIn = true
    }

    private func applyUser(displayName: String) {
        userDisplayName = displayName.isEmpty ? "Miguel" : displayName
        userFullName    = "Miguel Angel"
        userSurname     = "Tomairo Mendez"
    }

    private func extractName(from email: String) -> String {
        let trimmed = email.trimmingCharacters(in: .whitespaces)
        guard let atIndex = trimmed.firstIndex(of: "@") else { return "" }
        let prefix = String(trimmed[..<atIndex])
        let name   = prefix.replacingOccurrences(of: ".", with: " ")
        return name.prefix(1).uppercased() + name.dropFirst().lowercased()
    }
}
