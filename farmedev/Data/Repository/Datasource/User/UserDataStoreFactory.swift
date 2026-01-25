//
//  UserDataStoreFactory.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class UserDataStoreFactory {
    
    private init() { }
    
    static let shared = UserDataStoreFactory()
    
    func createCloud() -> UserDataStore {
        UserCloudDataStore()
    }
    
    func createLocal() -> UserDataStore {
        UserLocalDataStore()
    }
}
