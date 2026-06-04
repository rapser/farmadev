//
//  CouponDetailUseCase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CouponDetailUseCase {
    
    private let couponRepository: CouponDetailRepository
    
    init(couponRepository: CouponDetailRepository) {
        self.couponRepository = couponRepository
    }
    
    func getCouponDetailOnline(numDoc: String, id: String) async throws -> CouponDetail {
        try await couponRepository.getDetailCoupon(numDoc: numDoc, id: id)
    }
    
    func getCouponDetailOnlineMock() async throws -> CouponDetail {
        try await couponRepository.getDetailCouponMock()
    }
}
