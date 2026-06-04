//
//  CouponsCloudDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CouponsCloudDataStore: CouponsDataStore {
    
    func getCoupons() async throws -> CouponsDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "CouponsCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
}
