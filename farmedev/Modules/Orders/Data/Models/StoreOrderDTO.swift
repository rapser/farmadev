//
//  StoreOrderDTO.swift
//  farmedev
//

import Foundation

struct StoreOrderItemDTO: Decodable {
    let productId: String
    let productNameSnapshot: String
    let unitPrice: String
    let quantity: Int
    let lineTotal: String
}

struct StoreOrderDTO: Decodable {
    let id: String
    let status: String
    let paymentMethod: String
    let subtotal: String
    let total: String
    let deliveryAddressLine: String
    let deliveryDistrict: String
    let deliveryReference: String?
    let items: [StoreOrderItemDTO]
    let createdAt: String
}
