//
//  ReferedDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol ReferedDataStore {
    func addCode(request: PromoCodeRequest) async throws -> DiscountCodeDTO
    func getReferedUser(filter: String, coupon: String) async throws -> DiscountReferedUserDTO
    func getDiscountUser(request: ReferedCodeRequest) async throws -> DiscountCodeUserDTO
}
