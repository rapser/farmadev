//
//  ComprasViewModel.swift
//  farmedev
//

import Foundation

@Observable
final class ComprasViewModel {
    var categories: [StoreCategoryUI] = []
    var banners: [StoreBannerUI] = []
    var offerProducts: [StoreProductUI] = []
    var bestSellingProducts: [StoreProductUI] = []
    var isLoading = false

    var searchText: String = "" {
        didSet { scheduleSearch() }
    }
    var searchResults: [StoreProductUI] = []
    var isSearching = false
    private var searchTask: Task<Void, Never>?

    private let catalogUseCase: StoreCatalogUseCase

    init(catalogUseCase: StoreCatalogUseCase = StoreCatalogUseCase()) {
        self.catalogUseCase = catalogUseCase
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }

        async let categoriesResult = try? catalogUseCase.getCategories()
        async let bannersResult = try? catalogUseCase.getBanners(placement: "shop_top")
        async let offersResult = try? catalogUseCase.getFeaturedProducts(limit: 10)
        async let bestSellingResult = try? catalogUseCase.getProducts(page: 1, limit: 10)

        categories = (await categoriesResult)?.map { $0.toUI() } ?? []
        banners = (await bannersResult)?.map { $0.toUI() } ?? []
        offerProducts = (await offersResult)?.map { $0.toUI() } ?? []
        // Simplification: no sales-ranking column on the backend yet, so "best selling" reuses
        // the plain product list (page 1) rather than a real ranking.
        bestSellingProducts = (await bestSellingResult)?.items.map { $0.toUI() } ?? []
    }

    private func scheduleSearch() {
        searchTask?.cancel()
        let query = searchText.trimmingCharacters(in: .whitespaces)
        guard !query.isEmpty else {
            searchResults = []
            isSearching = false
            return
        }
        isSearching = true
        searchTask = Task {
            try? await Task.sleep(nanoseconds: 300_000_000)
            guard !Task.isCancelled else { return }
            let result = try? await catalogUseCase.getProducts(search: query, page: 1, limit: 30)
            guard !Task.isCancelled else { return }
            searchResults = result?.items.map { $0.toUI() } ?? []
        }
    }
}
