//
//  CouponCloudDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CouponCloudDataStore: CouponDataStore {
    
    func getCoupons(docNumber: String) async throws -> CouponAnswerDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "CouponCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func searchCouponPredictiveKeyword(query: String, codeCampaings: String) async throws -> CampaingPredictiveDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "CouponCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getCouponsMock() async throws -> CouponAnswerDTO {
        // TODO: Implementar llamada a API REST (mock)
        throw NSError(domain: "CouponCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
}
