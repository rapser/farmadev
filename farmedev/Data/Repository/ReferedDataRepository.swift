//
//  ReferedDataRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ReferedDataRepository: ReferedRepository {
    
    private let referedDataStoreFactory: ReferedDataStoreFactory
    
    init(referedDataStoreFactory: ReferedDataStoreFactory) {
        self.referedDataStoreFactory = referedDataStoreFactory
    }
    
    func addCode(promoRequest: PromoCodeRequest) async throws -> DiscountCode {
        let cloudDataStore = referedDataStoreFactory.createCloud()
        let discountCodeDTO = try await cloudDataStore.addCode(request: promoRequest)
        return discountCodeDTO.toDomain()
    }
    
    func getReferedUser(filter: String, coupon: String) async throws -> DiscountReferedUser {
        let cloudDataStore = referedDataStoreFactory.createCloud()
        let discountReferedUserDTO = try await cloudDataStore.getReferedUser(filter: filter, coupon: coupon)
        return discountReferedUserDTO.toDomain()
    }
    
    func getDiscountUser(referedCodeRequest: ReferedCodeRequest) async throws -> DiscountCodeUser {
        let cloudDataStore = referedDataStoreFactory.createCloud()
        let discountCodeUserDTO = try await cloudDataStore.getDiscountUser(request: referedCodeRequest)
        return discountCodeUserDTO.toDomain()
    }
}
