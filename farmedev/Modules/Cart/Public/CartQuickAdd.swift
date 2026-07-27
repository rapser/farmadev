//
//  CartQuickAdd.swift
//  farmedev
//
//  Fire-and-forget add-to-cart for screens that don't otherwise hold a CartViewModel —
//  works for both guest (local) and authenticated (cloud) sessions since CartUseCase
//  already routes based on auth state. Takes Catalog's Public `CatalogProductSummary`
//  (not a Catalog/Presentation type) so Cart's Public surface never depends on another
//  module's Presentation layer.
//

import Foundation

enum CartQuickAdd {
    static func add(_ product: CatalogProductSummary, quantity: Int) {
        Task {
            _ = try? await CartUseCase().addItem(product: product, quantity: quantity)
        }
    }
}
