//
//  ReferedDataStoreFactory.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ReferedDataStoreFactory {
    
    private init() { }
    
    static let shared = ReferedDataStoreFactory()
    
    func createCloud() -> ReferedDataStore {
        ReferedCloudDataStore()
    }
}
