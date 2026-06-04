//
//  CatalogDataStoreFactory.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CatalogDataStoreFactory {
    
    private init() { }
    
    static let shared = CatalogDataStoreFactory()
    
    func createCloud() -> CatalogDataStore {
        CatalogCloudDataStore()
    }
    
    func createLocal() -> CatalogDataStore {
        CatalogLocalDataStore()
    }
}
