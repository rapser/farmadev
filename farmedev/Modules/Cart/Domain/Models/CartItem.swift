//
//  CartItem.swift
//  farmedev
//

import Foundation

struct CartItem: Identifiable, Equatable {
    var id: String { productId }
    let productId: String
    let productName: String
    let imageUrl: String
    let unitPrice: Double
    let quantity: Int

    var lineTotal: Double { unitPrice * Double(quantity) }
}
