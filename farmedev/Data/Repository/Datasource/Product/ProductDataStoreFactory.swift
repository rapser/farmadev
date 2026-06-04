//
//  ProductDataStoreFactory.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ProductDataStoreFactory {
    
    private init() { }
    
    static let shared = ProductDataStoreFactory()
    
    func createLocal() -> ProductDataStore {
        ProductLocalDataStore()
    }
    
    func createCloud() -> ProductDataStore {
        ProductCloudDataStore()
    }
    
    func createContentful() -> ProductDataStore {
        ProductContentfulDataStore()
    }
}
