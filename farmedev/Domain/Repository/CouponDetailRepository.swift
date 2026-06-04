//
//  CouponDetailRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol CouponDetailRepository {
    func getDetailCoupon(numDoc: String, id: String) async throws -> CouponDetail
    
    func getDetailCouponMock() async throws -> CouponDetail
}
