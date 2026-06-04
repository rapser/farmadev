//
//  ReferedUseCase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ReferedUseCase {
    
    private let referedRepository: ReferedRepository
    
    init(referedRepository: ReferedRepository) {
        self.referedRepository = referedRepository
    }
    
    func addCode(request: PromoCodeRequest) async throws -> DiscountCode {
        try await referedRepository.addCode(promoRequest: request)
    }
    
    func getReferedUser(filter: String, coupon: String) async throws -> DiscountReferedUser {
        try await referedRepository.getReferedUser(filter: filter, coupon: coupon)
    }
    
    func getDiscountUser(request: ReferedCodeRequest) async throws -> DiscountCodeUser {
        try await referedRepository.getDiscountUser(referedCodeRequest: request)
    }
}
