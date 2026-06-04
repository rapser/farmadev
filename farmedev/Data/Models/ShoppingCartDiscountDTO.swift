//
//  ShoppingCartDiscountDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct ShoppingCartDiscountDTO: Codable {
    let subtotal: Double?
    let total: Double?
    let decimalTotal: Double?
    let discount: Double?
    let discountId: Int?
    let deliveryCost: Double?
    let discountedAmountCanonical: DiscountAmountDTO?
    let totalNoRounding: Double?
    let productsTotalRounding: Double?
    let ahorro: Double?
    let totalOnline: Double?
}
