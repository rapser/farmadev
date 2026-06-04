//
//  AuthDataStoreFactory.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class AuthDataStoreFactory {
    
    private init() { }
    
    static let shared = AuthDataStoreFactory()
    
    func createFirebase() -> AuthDataStore {
        AuthCloudDataStore()
    }
}
