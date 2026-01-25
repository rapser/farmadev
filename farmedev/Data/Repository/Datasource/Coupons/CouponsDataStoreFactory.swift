//
//  CouponsDataStoreFactory.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CouponsDataStoreFactory {
    
    private init() { }
    
    static let shared = CouponsDataStoreFactory()
    
    func createCloud() -> CouponsDataStore {
        CouponsCloudDataStore()
    }
}
