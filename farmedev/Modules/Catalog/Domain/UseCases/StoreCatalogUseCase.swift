//
//  StoreCatalogUseCase.swift
//  farmedev
//

import Foundation

final class StoreCatalogUseCase {
    private let repository: StoreCatalogRepository

    init(repository: StoreCatalogRepository = StoreCatalogDataRepository()) {
        self.repository = repository
    }

    func getCategories() async throws -> [StoreCategory] {
        try await repository.getCategories()
    }

    func getProducts(search: String? = nil, categoryId: String? = nil, page: Int = 1, limit: Int = 20) async throws -> Paginated<StoreProduct> {
        try await repository.getProducts(search: search, categoryId: categoryId, page: page, limit: limit)
    }

    func getProduct(id: String) async throws -> StoreProduct {
        try await repository.getProduct(id: id)
    }

    func getFeaturedProducts(limit: Int = 10) async throws -> [StoreProduct] {
        try await repository.getFeaturedProducts(limit: limit)
    }

    func getBanners(placement: String? = nil) async throws -> [StoreBanner] {
        try await repository.getBanners(placement: placement)
    }

    func getFavorites() async throws -> [StoreProduct] {
        try await repository.getFavorites()
    }

    func addFavorite(productId: String) async throws {
        try await repository.addFavorite(productId: productId)
    }

    func removeFavorite(productId: String) async throws {
        try await repository.removeFavorite(productId: productId)
    }
}
