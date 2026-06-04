//
//  SessionStore.swift
//  farmedev
//

import Foundation

enum SessionStore {
    private static let emailKey = "session_email"

    static func save(email: String) {
        KeychainService.save(email, forKey: emailKey)
    }

    static func load() -> String? {
        KeychainService.load(forKey: emailKey)
    }

    static func clear() {
        KeychainService.delete(forKey: emailKey)
    }

    static var hasSession: Bool {
        load() != nil
    }
}
