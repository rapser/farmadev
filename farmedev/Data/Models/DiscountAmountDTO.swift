//
//  DiscountAmountDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct DiscountAmountDTO: Codable {
    let originalAmount: Double?
    let discountAmount: Double?
    let discountCanonical: DiscountCanonicalDTO?
}
