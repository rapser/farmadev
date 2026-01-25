//
//  AuthDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol AuthDataStore {
    func completeSignIn(
        with provider: AuthenticationProvider,
        accessToken: String,
        idToken: String?
    ) async throws
    
    func getInstanceToken() async throws -> String
    
    func refreshToken() async throws -> String
    
    func refreshSecondToken(firebaseName: String) async throws -> String
    
    func getUID() async throws -> String
}
