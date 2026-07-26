//
//  CartCloudDataStore.swift
//  farmedev
//

import Foundation

final class CartCloudDataStore: CartRepository {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClientFactory.shared.client) {
        self.apiClient = apiClient
    }

    func getCart() async throws -> Cart {
        let dto: CartDTO = try await apiClient.request(path: "cart", method: .get, body: nil, queryItems: nil)
        return dto.toDomain()
    }

    func addItem(product: CatalogProductSummary, quantity: Int) async throws -> Cart {
        struct Body: Encodable { let productId: String; let quantity: Int }
        let body = try JSONEncoder().encode(Body(productId: product.id, quantity: quantity))
        let dto: CartDTO = try await apiClient.request(path: "cart/items", method: .post, body: body, queryItems: nil)
        return dto.toDomain()
    }

    func updateItem(productId: String, quantity: Int) async throws -> Cart {
        struct Body: Encodable { let quantity: Int }
        let body = try JSONEncoder().encode(Body(quantity: quantity))
        let dto: CartDTO = try await apiClient.request(path: "cart/items/\(productId)", method: .patch, body: body, queryItems: nil)
        return dto.toDomain()
    }

    func removeItem(productId: String) async throws -> Cart {
        let dto: CartDTO = try await apiClient.request(path: "cart/items/\(productId)", method: .delete, body: nil, queryItems: nil)
        return dto.toDomain()
    }

    func clear() async throws -> Cart {
        let dto: CartDTO = try await apiClient.request(path: "cart", method: .delete, body: nil, queryItems: nil)
        return dto.toDomain()
    }
}
