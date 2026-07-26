//
//  SessionStore.swift
//  farmedev
//
//  Keychain-backed session storage: JWT access/refresh tokens and a cached profile
//  snapshot so AppState can show a name immediately on relaunch without waiting on
//  a network round-trip. `clear()` enumerates every key it owns so logout never
//  leaves stale credentials behind (see plan section 2.8.3).
//

import Foundation

struct CachedProfile: Equatable {
    let email: String
    let fullName: String
    let surname: String
}

enum SessionStore {
    private static let accessTokenKey = "session_access_token"
    private static let refreshTokenKey = "session_refresh_token"
    private static let profileEmailKey = "session_profile_email"
    private static let profileFullNameKey = "session_profile_full_name"
    private static let profileSurnameKey = "session_profile_surname"

    /// Every key this store writes to the Keychain. Add new keys here so `clear()`
    /// can never silently forget to remove them.
    private static let allKeys = [
        accessTokenKey,
        refreshTokenKey,
        profileEmailKey,
        profileFullNameKey,
        profileSurnameKey,
    ]

    // MARK: - Tokens

    static func saveTokens(access: String, refresh: String) {
        KeychainService.save(access, forKey: accessTokenKey)
        KeychainService.save(refresh, forKey: refreshTokenKey)
    }

    static func loadAccessToken() -> String? {
        KeychainService.load(forKey: accessTokenKey)
    }

    static func loadRefreshToken() -> String? {
        KeychainService.load(forKey: refreshTokenKey)
    }

    static func updateAccessToken(_ token: String) {
        KeychainService.save(token, forKey: accessTokenKey)
    }

    // MARK: - Cached profile

    static func saveProfile(_ profile: CachedProfile) {
        KeychainService.save(profile.email, forKey: profileEmailKey)
        KeychainService.save(profile.fullName, forKey: profileFullNameKey)
        KeychainService.save(profile.surname, forKey: profileSurnameKey)
    }

    static func loadProfile() -> CachedProfile? {
        guard
            let email = KeychainService.load(forKey: profileEmailKey),
            let fullName = KeychainService.load(forKey: profileFullNameKey),
            let surname = KeychainService.load(forKey: profileSurnameKey)
        else { return nil }
        return CachedProfile(email: email, fullName: fullName, surname: surname)
    }

    // MARK: - Session lifecycle

    static var hasSession: Bool {
        loadAccessToken() != nil
    }

    static func clear() {
        allKeys.forEach { KeychainService.delete(forKey: $0) }
    }
}
