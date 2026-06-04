//
//  SyncDataStoreFactory.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SyncDataStoreFactory {
    
    private init() { }
    
    static let shared = SyncDataStoreFactory()
    
    func createCloud() -> SyncDataStore {
        SyncCloudDataStore()
    }
    
    func createLocal() -> SyncDataStore {
        SyncLocalDataStore()
    }
}
