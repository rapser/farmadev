//
//  FavoritesViewModel.swift
//  farmedev
//

import Foundation

@Observable
final class FavoritesViewModel {
    var products: [StoreProductUI] = []
    var isLoading = false

    private let catalogUseCase: StoreCatalogUseCase

    init(catalogUseCase: StoreCatalogUseCase = StoreCatalogUseCase()) {
        self.catalogUseCase = catalogUseCase
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }
        products = (try? await catalogUseCase.getFavorites())?.map { $0.toUI() } ?? []
    }
}
