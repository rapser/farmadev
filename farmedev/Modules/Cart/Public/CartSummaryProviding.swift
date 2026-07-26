//
//  CartSummaryProviding.swift
//  farmedev
//
//  Read-only summary surface Checkout consumes instead of importing Modules/Cart/Domain.
//

import Foundation

struct CartSummary {
    let items: [CatalogProductSummary]
    let quantities: [String: Int]
    let subtotal: Double
    let itemCount: Int
}

enum CartSummaryProvider {
    static func current() async -> CartSummary {
        let cart = (try? await CartUseCase().getCart()) ?? .empty
        let items = cart.items.map { CatalogProductSummary(id: $0.productId, name: $0.productName, imageUrl: $0.imageUrl, price: $0.unitPrice, stock: .max) }
        let quantities = Dictionary(uniqueKeysWithValues: cart.items.map { ($0.productId, $0.quantity) })
        return CartSummary(items: items, quantities: quantities, subtotal: cart.subtotal, itemCount: cart.itemCount)
    }
}
