//
//  AuthDataRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class AuthDataRepository: AuthRepository {
    
    private let authDataStoreFactory: AuthDataStoreFactory
    private let sessionDataStoreFactory: SessionDataStoreFactory
    
    init(
        authDataStoreFactory: AuthDataStoreFactory,
        sessionDataStoreFactory: SessionDataStoreFactory
    ) {
        self.authDataStoreFactory = authDataStoreFactory
        self.sessionDataStoreFactory = sessionDataStoreFactory
    }
    
    func completeSignIn(
        with provider: AuthenticationProvider,
        email: String,
        accessToken: String,
        idToken: String?
    ) async throws {
        let authDataStore = authDataStoreFactory.createFirebase()
        let sessionDataStore = sessionDataStoreFactory.createLocal()
        
        try await authDataStore.completeSignIn(
            with: provider,
            accessToken: accessToken,
            idToken: idToken
        )
        
        try await sessionDataStore.saveSocialLoginEmail(email, forProvider: provider)
        try await refreshToken()
    }
    
    func refreshToken() async throws {
        let authDataStore = authDataStoreFactory.createFirebase()
        let sessionDataStore = sessionDataStoreFactory.createLocal()
        
        let token = try await authDataStore.refreshToken()
        try await sessionDataStore.saveToken(token: token)
    }
    
    func refreshSecondToken(firebaseName: String) async throws {
        let authDataStore = authDataStoreFactory.createFirebase()
        let sessionDataStore = sessionDataStoreFactory.createLocal()
        
        let token = try await authDataStore.refreshSecondToken(firebaseName: firebaseName)
        try await sessionDataStore.saveToken(token: token)
    }
}
