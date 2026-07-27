//
//  CartUseCase.swift
//  farmedev
//

import Foundation

final class CartUseCase {
    private let repository: CartRepository

    init(repository: CartRepository = CartDataRepository()) {
        self.repository = repository
    }

    func getCart() async throws -> Cart {
        try await repository.getCart()
    }

    func addItem(product: CatalogProductSummary, quantity: Int) async throws -> Cart {
        try await repository.addItem(product: product, quantity: quantity)
    }

    func updateItem(productId: String, quantity: Int) async throws -> Cart {
        try await repository.updateItem(productId: productId, quantity: quantity)
    }

    func removeItem(productId: String) async throws -> Cart {
        try await repository.removeItem(productId: productId)
    }

    func clear() async throws -> Cart {
        try await repository.clear()
    }
}
