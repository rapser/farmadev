//
//  AuthCloudDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class AuthCloudDataStore: AuthDataStore {
    
    func completeSignIn(
        with provider: AuthenticationProvider,
        accessToken: String,
        idToken: String?
    ) async throws {
        // TODO: Implementar con Firebase Auth usando async/await
        // Por ahora placeholder para la estructura
        throw NSError(domain: "AuthCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getInstanceToken() async throws -> String {
        // TODO: Implementar obtención de token de instancia
        throw NSError(domain: "AuthCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func refreshToken() async throws -> String {
        // TODO: Implementar refresh token
        throw NSError(domain: "AuthCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func refreshSecondToken(firebaseName: String) async throws -> String {
        // TODO: Implementar refresh second token
        throw NSError(domain: "AuthCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getUID() async throws -> String {
        // TODO: Implementar obtención de UID
        throw NSError(domain: "AuthCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
}
