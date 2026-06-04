//
//  ShoppingCartDiscountUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension ShoppingCartDiscount {

    func toUI() -> ShoppingCartDiscountUI {
        ShoppingCartDiscountUI(
            subtotal: String(format: "%.2f", subtotal),
            total: String(format: "%.2f", total),
            discount: String(format: "%.2f", discount),
            deliveryCost: String(format: "%.2f", deliveryCost),
            savings: String(format: "%.2f", ahorro)
        )
    }
}
