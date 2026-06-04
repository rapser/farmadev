//
//  CouponDetailDataRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CouponDetailDataRepository: CouponDetailRepository {
    
    private let couponDetailDataStoreFactory: CouponDetailDataStoreFactory
    
    init(couponDetailDataStoreFactory: CouponDetailDataStoreFactory) {
        self.couponDetailDataStoreFactory = couponDetailDataStoreFactory
    }
    
    func getDetailCoupon(numDoc: String, id: String) async throws -> CouponDetail {
        let cloudDataStore = couponDetailDataStoreFactory.createCloud()
        let couponDetailDTO = try await cloudDataStore.getCouponDetail(numDoc: numDoc, id: id)
        return couponDetailDTO.toDomain()
    }
    
    func getDetailCouponMock() async throws -> CouponDetail {
        let cloudDataStore = couponDetailDataStoreFactory.createCloud()
        let couponDetailDTO = try await cloudDataStore.getCouponDetailMock()
        return couponDetailDTO.toDomain()
    }
}
