//
//  ShoppingCartDiscount.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct ShoppingCartDiscount {
    let subtotal: Double
    let total: Double
    let decimalTotal: Double
    let discount: Double
    let discountId: Int
    let deliveryCost: Double
    let discountedAmountCanonical: DiscountAmount?
    let totalNoRounding: Double
    let productsTotalRounding: Double
    let ahorro: Double
    let totalOnline: Double
}
