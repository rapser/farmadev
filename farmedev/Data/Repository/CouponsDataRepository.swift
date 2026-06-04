//
//  CouponsDataRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CouponsDataRepository: CouponsRepository {
    
    private let couponsDataStoreFactory: CouponsDataStoreFactory
    
    init(couponsDataStoreFactory: CouponsDataStoreFactory) {
        self.couponsDataStoreFactory = couponsDataStoreFactory
    }
    
    func getCouponsOnline() async throws -> Coupons {
        let cloudDataStore = couponsDataStoreFactory.createCloud()
        let couponsDTO = try await cloudDataStore.getCoupons()
        return couponsDTO.toDomain()
    }
}
