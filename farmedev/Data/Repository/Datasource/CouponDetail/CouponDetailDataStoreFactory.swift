//
//  CouponDetailDataStoreFactory.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CouponDetailDataStoreFactory {
    
    private init() { }
    
    static let shared = CouponDetailDataStoreFactory()
    
    func createCloud() -> CouponDetailDataStore {
        CouponDetailCloudDataStore()
    }
}
