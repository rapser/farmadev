//
//  SupportDataStoreFactory.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SupportDataStoreFactory {
    
    private init() { }
    
    static let shared = SupportDataStoreFactory()
    
    func createCloud() -> SupportDataStore {
        SupportCloudDataStore()
    }
    
    func createLocal() -> SupportDataStore {
        SupportLocalDataStore()
    }
}
