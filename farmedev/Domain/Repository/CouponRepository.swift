//
//  CouponRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol CouponRepository {
    func getCoupons(docNumber: String) async throws -> [Coupon]
    
    func getCouponsMock() async throws -> [Coupon]
    
    func getCouponsCategories() -> [CouponAnswer.FamilyCategory]
    
    func searchCampaingPredictive(query: String, campaings: String) async throws -> CampaingPredictive
}
