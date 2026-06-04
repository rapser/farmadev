//
//  CouponDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol CouponDataStore {
    func getCoupons(docNumber: String) async throws -> CouponAnswerDTO
    
    func searchCouponPredictiveKeyword(query: String, codeCampaings: String) async throws -> CampaingPredictiveDTO
    
    func getCouponsMock() async throws -> CouponAnswerDTO
}
