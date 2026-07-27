//
//  ProductDetailViewModel.swift
//  farmedev
//

import Foundation

@Observable
final class ProductDetailViewModel {
    var product: StoreProductUI?
    var isLoading = false
    var isFavorite = false
    var errorMessage: String?

    private let productId: String
    private let catalogUseCase: StoreCatalogUseCase

    init(productId: String, catalogUseCase: StoreCatalogUseCase = StoreCatalogUseCase()) {
        self.productId = productId
        self.catalogUseCase = catalogUseCase
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }
        do {
            product = try await catalogUseCase.getProduct(id: productId).toUI()
        } catch {
            errorMessage = "No se pudo cargar el producto."
        }
    }

    func toggleFavorite() async {
        isFavorite.toggle()
        do {
            if isFavorite {
                try await catalogUseCase.addFavorite(productId: productId)
            } else {
                try await catalogUseCase.removeFavorite(productId: productId)
            }
        } catch {
            isFavorite.toggle() // revert on failure
        }
    }
}
