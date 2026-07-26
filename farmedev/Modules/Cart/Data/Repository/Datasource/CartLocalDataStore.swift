//
//  CartLocalDataStore.swift
//  farmedev
//

import Foundation
import SwiftData

final class CartLocalDataStore: CartRepository {
    private let container: ModelContainer

    init(container: ModelContainer = LocalCartContainer.shared) {
        self.container = container
    }

    func getCart() async throws -> Cart {
        Cart(items: try fetchAll().map { $0.toDomain() })
    }

    func addItem(product: CatalogProductSummary, quantity: Int) async throws -> Cart {
        let context = ModelContext(container)
        let items = try fetchAll(in: context)
        if let existing = items.first(where: { $0.productId == product.id }) {
            existing.quantity += quantity
        } else {
            context.insert(LocalCartItem(
                productId: product.id,
                productName: product.name,
                imageUrl: product.imageUrl,
                unitPrice: product.price,
                quantity: quantity
            ))
        }
        try context.save()
        return Cart(items: try fetchAll(in: context).map { $0.toDomain() })
    }

    func updateItem(productId: String, quantity: Int) async throws -> Cart {
        let context = ModelContext(container)
        let items = try fetchAll(in: context)
        if let existing = items.first(where: { $0.productId == productId }) {
            existing.quantity = quantity
            try context.save()
        }
        return Cart(items: try fetchAll(in: context).map { $0.toDomain() })
    }

    func removeItem(productId: String) async throws -> Cart {
        let context = ModelContext(container)
        let items = try fetchAll(in: context)
        if let existing = items.first(where: { $0.productId == productId }) {
            context.delete(existing)
            try context.save()
        }
        return Cart(items: try fetchAll(in: context).map { $0.toDomain() })
    }

    func clear() async throws -> Cart {
        let context = ModelContext(container)
        try fetchAll(in: context).forEach { context.delete($0) }
        try context.save()
        return .empty
    }

    /// All local guest items, for merging into the server cart right after login (section 2.8.2).
    /// Not part of `CartRepository` — called directly by `MergeGuestCartUseCase`.
    func allItems() throws -> [LocalCartItem] {
        try fetchAll()
    }

    func deleteAll() throws {
        let context = ModelContext(container)
        try fetchAll(in: context).forEach { context.delete($0) }
        try context.save()
    }

    // MARK: - Private

    private func fetchAll(in context: ModelContext? = nil) throws -> [LocalCartItem] {
        let ctx = context ?? ModelContext(container)
        return try ctx.fetch(FetchDescriptor<LocalCartItem>())
    }
}

extension LocalCartItem {
    func toDomain() -> CartItem {
        CartItem(productId: productId, productName: productName, imageUrl: imageUrl, unitPrice: unitPrice, quantity: quantity)
    }
}
