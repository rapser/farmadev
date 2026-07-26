//
//  CarritoViewModel.swift
//  farmedev
//

import Foundation

@Observable
final class CarritoViewModel {
    var cart: Cart = .empty
    var isLoading = false
    var suggestedProducts: [StoreProductUI] = []

    private let cartUseCase: CartUseCase
    private let catalogUseCase: StoreCatalogUseCase

    init(cartUseCase: CartUseCase = CartUseCase(), catalogUseCase: StoreCatalogUseCase = StoreCatalogUseCase()) {
        self.cartUseCase = cartUseCase
        self.catalogUseCase = catalogUseCase
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }
        cart = (try? await cartUseCase.getCart()) ?? .empty
        if suggestedProducts.isEmpty {
            suggestedProducts = (try? await catalogUseCase.getFeaturedProducts(limit: 10))?.map { $0.toUI() } ?? []
        }
    }

    func addSuggested(_ product: StoreProductUI) async {
        cart = (try? await cartUseCase.addItem(product: product.summary, quantity: 1)) ?? cart
    }

    func updateQuantity(productId: String, quantity: Int) async {
        if quantity <= 0 {
            cart = (try? await cartUseCase.removeItem(productId: productId)) ?? cart
        } else {
            cart = (try? await cartUseCase.updateItem(productId: productId, quantity: quantity)) ?? cart
        }
    }

    func removeItem(productId: String) async {
        cart = (try? await cartUseCase.removeItem(productId: productId)) ?? cart
    }
}
