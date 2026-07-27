//
//  StoreCatalogDataRepository.swift
//  farmedev
//

import Foundation

final class StoreCatalogDataRepository: StoreCatalogRepository {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClientFactory.shared.client) {
        self.apiClient = apiClient
    }

    func getCategories() async throws -> [StoreCategory] {
        let dtos: [StoreCategoryDTO] = try await apiClient.request(path: "categories", method: .get, body: nil, queryItems: nil)
        return dtos.map { $0.toDomain() }
    }

    func getProducts(search: String?, categoryId: String?, page: Int, limit: Int) async throws -> Paginated<StoreProduct> {
        var items: [URLQueryItem] = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "limit", value: String(limit)),
        ]
        if let search, !search.isEmpty { items.append(URLQueryItem(name: "search", value: search)) }
        if let categoryId { items.append(URLQueryItem(name: "categoryId", value: categoryId)) }

        let dto: PaginatedDTO<StoreProductDTO> = try await apiClient.request(path: "products", method: .get, body: nil, queryItems: items)
        return Paginated(items: dto.items.map { $0.toDomain() }, total: dto.total, page: dto.page, limit: dto.limit)
    }

    func getProduct(id: String) async throws -> StoreProduct {
        let dto: StoreProductDTO = try await apiClient.request(path: "products/\(id)", method: .get, body: nil, queryItems: nil)
        return dto.toDomain()
    }

    func getFeaturedProducts(limit: Int) async throws -> [StoreProduct] {
        let dtos: [StoreProductDTO] = try await apiClient.request(
            path: "products/featured", method: .get, body: nil,
            queryItems: [URLQueryItem(name: "limit", value: String(limit))]
        )
        return dtos.map { $0.toDomain() }
    }

    func getBanners(placement: String?) async throws -> [StoreBanner] {
        var items: [URLQueryItem] = []
        if let placement { items.append(URLQueryItem(name: "placement", value: placement)) }
        let dtos: [StoreBannerDTO] = try await apiClient.request(path: "banners", method: .get, body: nil, queryItems: items)
        return dtos.map { $0.toDomain() }
    }

    func getFavorites() async throws -> [StoreProduct] {
        let dtos: [StoreProductDTO] = try await apiClient.request(path: "products/favorites", method: .get, body: nil, queryItems: nil)
        return dtos.map { $0.toDomain() }
    }

    func addFavorite(productId: String) async throws {
        try await apiClient.requestVoid(path: "products/\(productId)/favorite", method: .post, body: nil, queryItems: nil)
    }

    func removeFavorite(productId: String) async throws {
        try await apiClient.requestVoid(path: "products/\(productId)/favorite", method: .delete, body: nil, queryItems: nil)
    }
}
