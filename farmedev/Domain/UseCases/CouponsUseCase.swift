//
//  CouponsUseCase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CouponsUseCase {
    private let couponsRepository: CouponsRepository
    
    init(couponsRepository: CouponsRepository) {
        self.couponsRepository = couponsRepository
    }
    
    func getCoupons() async throws -> Coupons {
        try await couponsRepository.getCouponsOnline()
    }
}
