//
//  AppAuthUseCase.swift
//  farmedev
//

import Foundation

final class AppAuthUseCase {
    private let repository: AppAuthRepository

    init(repository: AppAuthRepository = AppAuthDataRepository()) {
        self.repository = repository
    }

    func register(email: String, password: String, fullName: String, surname: String) async throws -> AuthUser {
        try await repository.register(email: email, password: password, fullName: fullName, surname: surname)
    }

    func login(email: String, password: String) async throws -> AuthUser {
        try await repository.login(email: email, password: password)
    }

    func logout() async {
        await repository.logout()
    }

    func me() async throws -> AuthUser {
        try await repository.me()
    }

    func updateProfile(fullName: String?, surname: String?, phone: String?) async throws -> AuthUser {
        try await repository.updateProfile(fullName: fullName, surname: surname, phone: phone)
    }

    func forgotPassword(email: String) async throws -> String? {
        try await repository.forgotPassword(email: email)
    }

    func resetPassword(resetToken: String, newPassword: String) async throws {
        try await repository.resetPassword(resetToken: resetToken, newPassword: newPassword)
    }

    func changePassword(currentPassword: String, newPassword: String) async throws {
        try await repository.changePassword(currentPassword: currentPassword, newPassword: newPassword)
    }
}
