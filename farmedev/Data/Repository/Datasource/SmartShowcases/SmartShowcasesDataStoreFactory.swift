//
//  SmartShowcasesDataStoreFactory.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SmartShowcasesDataStoreFactory {
    
    private init() { }
    
    static let shared = SmartShowcasesDataStoreFactory()
    
    func createCloud() -> SmartShowcasesDataStore {
        SmartShowcasesCloudDataStore()
    }
    
    func createContentful() -> SmartShowcasesDataStore {
        SmartShowcaseContentfulDataStore()
    }
    
    func createLocal() -> SmartShowcasesDataStore {
        SmartShowcasesLocalDataStore()
    }
}
