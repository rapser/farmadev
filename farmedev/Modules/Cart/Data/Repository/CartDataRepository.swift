//
//  CartDataRepository.swift
//  farmedev
//
//  Routes to the local (SwiftData) store for guests and the cloud store for authenticated
//  users — the same "pick a DataStore based on state" pattern the legacy pipeline models
//  via its *DataStoreFactory types, just driven by auth state instead of a config flag.
//

import Foundation

final class CartDataRepository: CartRepository {
    private let cloud: CartRepository
    private let local: CartRepository
    private let isLoggedIn: () -> Bool

    init(
        cloud: CartRepository = CartCloudDataStore(),
        local: CartRepository = CartLocalDataStore(),
        isLoggedIn: @escaping () -> Bool = { CurrentSession.isLoggedIn }
    ) {
        self.cloud = cloud
        self.local = local
        self.isLoggedIn = isLoggedIn
    }

    private var active: CartRepository { isLoggedIn() ? cloud : local }

    func getCart() async throws -> Cart { try await active.getCart() }

    func addItem(product: CatalogProductSummary, quantity: Int) async throws -> Cart {
        try await active.addItem(product: product, quantity: quantity)
    }

    func updateItem(productId: String, quantity: Int) async throws -> Cart {
        try await active.updateItem(productId: productId, quantity: quantity)
    }

    func removeItem(productId: String) async throws -> Cart {
        try await active.removeItem(productId: productId)
    }

    func clear() async throws -> Cart { try await active.clear() }
}
