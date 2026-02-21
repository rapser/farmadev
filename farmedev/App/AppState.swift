//
//  AppState.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
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

    func login(email: String) {
        let name = extractName(from: email)
        userDisplayName = name.isEmpty ? "Miguel" : name
        userFullName = "Miguel Angel"
        userSurname = "Tomairo Mendez"
        isLoggedIn = true
    }

    func loginWithSocial(provider: String) {
        userDisplayName = "Miguel"
        userFullName = "Miguel Angel"
        userSurname = "Tomairo Mendez"
        isLoggedIn = true
    }

    func logout() {
        isLoggedIn = false
    }

    private func extractName(from email: String) -> String {
        let trimmed = email.trimmingCharacters(in: .whitespaces)
        guard let atIndex = trimmed.firstIndex(of: "@") else { return "" }
        let prefix = String(trimmed[..<atIndex])
        let name = prefix.replacingOccurrences(of: ".", with: " ")
        return name.prefix(1).uppercased() + name.dropFirst().lowercased()
    }
}
