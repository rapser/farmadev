//
//  StoreCatalogRepository.swift
//  farmedev
//

import Foundation

protocol StoreCatalogRepository {
    func getCategories() async throws -> [StoreCategory]
    func getProducts(search: String?, categoryId: String?, page: Int, limit: Int) async throws -> Paginated<StoreProduct>
    func getProduct(id: String) async throws -> StoreProduct
    func getFeaturedProducts(limit: Int) async throws -> [StoreProduct]
    func getBanners(placement: String?) async throws -> [StoreBanner]
    func getFavorites() async throws -> [StoreProduct]
    func addFavorite(productId: String) async throws
    func removeFavorite(productId: String) async throws
}
