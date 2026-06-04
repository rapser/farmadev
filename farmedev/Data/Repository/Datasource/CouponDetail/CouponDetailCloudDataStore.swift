//
//  CouponDetailCloudDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CouponDetailCloudDataStore: CouponDetailDataStore {
    
    func getCouponDetail(numDoc: String, id: String) async throws -> CouponDetailDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "CouponDetailCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getCouponDetailMock() async throws -> CouponDetailDTO {
        // TODO: Implementar llamada a API REST (mock)
        throw NSError(domain: "CouponDetailCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
}
