//
//  AuthUseCase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class AuthUseCase {
    
    private let authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func completeSignIn(_ request: CompleteSignInRequest) async throws {
        try await authRepository.completeSignIn(
            with: request.provider,
            email: request.email,
            accessToken: request.accessToken,
            idToken: request.idToken
        )
    }
    
    func refreshToken() async throws {
        try await authRepository.refreshToken()
    }
    
    func refreshSecondToken(firebaseName: String) async throws {
        try await authRepository.refreshSecondToken(firebaseName: firebaseName)
    }
}
