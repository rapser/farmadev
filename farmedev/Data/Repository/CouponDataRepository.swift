//
//  CouponDataRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CouponDataRepository: CouponRepository {
    
    private let couponDataStoreFactory: CouponDataStoreFactory
    private var familyCategoryList: [CouponAnswer.FamilyCategory] = []
    
    init(couponDataStoreFactory: CouponDataStoreFactory) {
        self.couponDataStoreFactory = couponDataStoreFactory
    }
    
    func getCoupons(docNumber: String) async throws -> [Coupon] {
        let cloudDataStore = couponDataStoreFactory.createCloud()
        let couponAnswerDTO = try await cloudDataStore.getCoupons(docNumber: docNumber)
        
        // Guardar familyCategory para uso posterior
        familyCategoryList = couponAnswerDTO.familyCategory?.map { $0.toDomain() } ?? []
        
        return couponAnswerDTO.data?.map { $0.toDomain() } ?? []
    }
    
    func getCouponsMock() async throws -> [Coupon] {
        let cloudDataStore = couponDataStoreFactory.createCloud()
        let couponAnswerDTO = try await cloudDataStore.getCouponsMock()
        
        // Guardar familyCategory para uso posterior
        familyCategoryList = couponAnswerDTO.familyCategory?.map { $0.toDomain() } ?? []
        
        return couponAnswerDTO.data?.map { $0.toDomain() } ?? []
    }
    
    func getCouponsCategories() -> [CouponAnswer.FamilyCategory] {
        familyCategoryList
    }
    
    func searchCampaingPredictive(query: String, campaings: String) async throws -> CampaingPredictive {
        let cloudDataStore = couponDataStoreFactory.createCloud()
        let campaingPredictiveDTO = try await cloudDataStore.searchCouponPredictiveKeyword(query: query, codeCampaings: campaings)
        return campaingPredictiveDTO.toDomain()
    }
}
