//
//  ProductGridViewModel.swift
//  farmedev
//

import Foundation

@Observable
final class ProductGridViewModel {
    var products: [StoreProductUI] = []
    var isLoading = false
    var canLoadMore = true

    private let categoryId: String?
    private let search: String?
    private var page = 1
    private let limit = 20
    private let catalogUseCase: StoreCatalogUseCase

    init(categoryId: String? = nil, search: String? = nil, catalogUseCase: StoreCatalogUseCase = StoreCatalogUseCase()) {
        self.categoryId = categoryId
        self.search = search
        self.catalogUseCase = catalogUseCase
    }

    func loadFirstPage() async {
        page = 1
        products = []
        canLoadMore = true
        await loadNextPage()
    }

    func loadNextPage() async {
        guard canLoadMore, !isLoading else { return }
        isLoading = true
        defer { isLoading = false }

        do {
            let result = try await catalogUseCase.getProducts(search: search, categoryId: categoryId, page: page, limit: limit)
            products.append(contentsOf: result.items.map { $0.toUI() })
            canLoadMore = products.count < result.total
            page += 1
        } catch {
            canLoadMore = false
        }
    }
}
