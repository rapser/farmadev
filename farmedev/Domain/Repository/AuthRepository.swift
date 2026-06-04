//
//  AuthRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol AuthRepository {
    func completeSignIn(
        with provider: AuthenticationProvider,
        email: String,
        accessToken: String,
        idToken: String?
    ) async throws
    
    func refreshToken() async throws
    
    func refreshSecondToken(firebaseName: String) async throws
}
