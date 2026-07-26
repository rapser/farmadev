//
//  OrderSummary.swift
//  farmedev
//

import Foundation

struct OrderSummary: Identifiable {
    let id: String
    let status: String
    let totalLabel: String
    let createdAt: Date
}

extension StoreOrder {
    var summary: OrderSummary {
        OrderSummary(id: id, status: status, totalLabel: CurrencyFormatting.soles(total), createdAt: createdAt)
    }
}
