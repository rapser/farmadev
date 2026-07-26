//
//  StoreOrder.swift
//  farmedev
//

import Foundation

struct StoreOrderItem: Identifiable, Equatable {
    var id: String { productId }
    let productId: String
    let productName: String
    let unitPrice: Double
    let quantity: Int
    let lineTotal: Double
}

struct StoreOrder: Identifiable, Equatable {
    let id: String
    let status: String
    let paymentMethod: String
    let subtotal: Double
    let total: Double
    let deliveryAddressLine: String
    let deliveryDistrict: String
    let deliveryReference: String?
    let items: [StoreOrderItem]
    let createdAt: Date
}
