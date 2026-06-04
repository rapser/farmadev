//
//  OrderDataStoreFactory.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class OrderDataStoreFactory {
    
    private init() { }
    
    static let shared = OrderDataStoreFactory()
    
    func createCloud() -> OrderDataStore {
        OrderCloudDataStore()
    }
    
    func createLocal() -> OrderDataStore {
        OrderLocalDataStore()
    }
    
    func createFirebase() -> OrderDataStore {
        OrderFirebaseDataStore()
    }
}
