//
//  ReferedRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol ReferedRepository {
    func addCode(promoRequest: PromoCodeRequest) async throws -> DiscountCode
    
    func getReferedUser(filter: String, coupon: String) async throws -> DiscountReferedUser
    
    func getDiscountUser(referedCodeRequest: ReferedCodeRequest) async throws -> DiscountCodeUser
}
