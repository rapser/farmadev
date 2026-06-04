//
//  CouponsDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol CouponsDataStore {
    func getCoupons() async throws -> CouponsDTO
}
