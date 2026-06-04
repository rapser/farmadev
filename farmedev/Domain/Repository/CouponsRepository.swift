//
//  CouponsRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol CouponsRepository {
    func getCouponsOnline() async throws -> Coupons
}
