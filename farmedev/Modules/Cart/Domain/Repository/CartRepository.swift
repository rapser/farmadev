//
//  CartRepository.swift
//  farmedev
//

import Foundation

protocol CartRepository {
    func getCart() async throws -> Cart
    func addItem(product: CatalogProductSummary, quantity: Int) async throws -> Cart
    func updateItem(productId: String, quantity: Int) async throws -> Cart
    func removeItem(productId: String) async throws -> Cart
    func clear() async throws -> Cart
}
