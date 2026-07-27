//
//  InicioViewModel.swift
//  farmedev
//

import Foundation

@Observable
final class InicioViewModel {
    var isLoading = false
    var categories: [StoreCategoryUI] = []
    var featuredProducts: [StoreProductUI] = []
    var banners: [StoreBannerUI] = []

    private let catalogUseCase: StoreCatalogUseCase

    init(catalogUseCase: StoreCatalogUseCase = StoreCatalogUseCase()) {
        self.catalogUseCase = catalogUseCase
    }

    @MainActor
    func load() async {
        isLoading = true
        defer { isLoading = false }

        async let categoriesResult = try? catalogUseCase.getCategories()
        async let featuredResult = try? catalogUseCase.getFeaturedProducts(limit: 6)
        async let bannersResult = try? catalogUseCase.getBanners(placement: "home_top")

        categories = (await categoriesResult)?.map { $0.toUI() } ?? []
        featuredProducts = (await featuredResult)?.map { $0.toUI() } ?? []
        banners = (await bannersResult)?.map { $0.toUI() } ?? []
    }
}
