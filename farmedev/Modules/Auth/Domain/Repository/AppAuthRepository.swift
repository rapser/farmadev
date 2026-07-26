//
//  AppAuthRepository.swift
//  farmedev
//
//  Named "AppAuthRepository" (not "AuthRepository") to avoid colliding with the legacy,
//  unused Firebase-shaped AuthRepository in Domain/Repository — left untouched since
//  legacy UserDataRepository still depends on its datastore factory. See PLAN.md section 2.5.
//

import Foundation

protocol AppAuthRepository {
    func register(email: String, password: String, fullName: String, surname: String) async throws -> AuthUser
    func login(email: String, password: String) async throws -> AuthUser
    func logout() async
    func me() async throws -> AuthUser
    func updateProfile(fullName: String?, surname: String?, phone: String?) async throws -> AuthUser
    func forgotPassword(email: String) async throws -> String?
    func resetPassword(resetToken: String, newPassword: String) async throws
    func changePassword(currentPassword: String, newPassword: String) async throws
}
