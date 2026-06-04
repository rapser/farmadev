//
//  CouponDataStoreFactory.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CouponDataStoreFactory {
    
    private init() { }
    
    static let shared = CouponDataStoreFactory()
    
    func createCloud() -> CouponDataStore {
        CouponCloudDataStore()
    }
}
