//
//  CouponDetailDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol CouponDetailDataStore {
    func getCouponDetail(numDoc: String, id: String) async throws -> CouponDetailDTO
    
    func getCouponDetailMock() async throws -> CouponDetailDTO
}
