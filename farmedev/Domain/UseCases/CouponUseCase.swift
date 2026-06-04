//
//  CouponUseCase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CouponUseCase {
    
    private let couponRepository: CouponRepository
    
    init(couponRepository: CouponRepository) {
        self.couponRepository = couponRepository
    }
    
    func getCoupons(docNumber: String) async throws -> [Coupon] {
        try await couponRepository.getCoupons(docNumber: docNumber)
    }
    
    func getCouponsMock() async throws -> [Coupon] {
        try await couponRepository.getCouponsMock()
    }
    
    func getCouponsCategories() -> [CouponAnswer.FamilyCategory] {
        couponRepository.getCouponsCategories()
    }
    
    func searchCampaingPredictiveKeyword(query: String, campaings: String) async throws -> CampaingPredictive {
        try await couponRepository.searchCampaingPredictive(query: query, campaings: campaings)
    }
}
