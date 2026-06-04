//
//  ConfigDataStoreFactory.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ConfigDataStoreFactory {
    
    private init() { }
    
    static let shared = ConfigDataStoreFactory()
    
    func createCloud() -> ConfigDataStore {
        ConfigCloudDataStore()
    }
    
    func createLocal() -> ConfigDataStore {
        ConfigLocalDataStore()
    }
    
    func createContentful() -> ConfigDataStore {
        ConfigContentfulDataStore()
    }
}
