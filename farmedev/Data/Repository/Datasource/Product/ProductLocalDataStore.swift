//
//  ProductLocalDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ProductLocalDataStore: ProductDataStore {
    
    private let userDefaults = UserDefaults.standard
    private let shoppingCartKey = "shopping_cart_items"
    
    func getDashboard() async throws -> [DashboardItemDTO] {
        // TODO: Implementar lectura desde UserDefaults o CoreData
        if let data = userDefaults.data(forKey: "dashboard_items"),
           let items = try? JSONDecoder().decode([DashboardItemDTO].self, from: data) {
            return items
        }
        return []
    }
    
    func saveDashboard(dashboard: [DashboardItemDTO]) async throws -> [DashboardItemDTO] {
        if let data = try? JSONEncoder().encode(dashboard) {
            userDefaults.set(data, forKey: "dashboard_items")
        }
        return dashboard
    }
    
    func getAndSaveConfig() async throws -> ContentConfigDTO {
        // TODO: Implementar
        throw NSError(domain: "ProductLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getSliderCategory() async throws -> [SliderCategoryDTO] {
        // TODO: Implementar
        return []
    }
    
    func getLandingList(keyword: String) async throws -> LandingListDTO {
        // TODO: Implementar
        throw NSError(domain: "ProductLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getShoppingCart() -> [ShoppingCartItemDTO] {
        guard let data = userDefaults.data(forKey: shoppingCartKey),
              let items = try? JSONDecoder().decode([ShoppingCartItemDTO].self, from: data) else {
            return []
        }
        return items
    }
    
    func addProductShoppingCart(product: ProductDashboardDTO, quantity: Int, presentationIdSelected: Int) -> Bool {
        // TODO: Implementar lógica de agregar producto
        return false
    }
    
    func addProductShoppingCart(product: ProductListDTO, lam: ProductListDTO?, quantity: Int, presentationIdSelected: Int) -> Bool {
        // TODO: Implementar lógica de agregar producto
        return false
    }
    
    func checkProductShoppingCart(productId: String) -> Bool {
        let cart = getShoppingCart()
        return cart.contains { $0.product?.id == productId }
    }
    
    func deleteProductShoppingCart(productId: String) -> Bool {
        var cart = getShoppingCart()
        cart.removeAll { $0.product?.id == productId }
        if let data = try? JSONEncoder().encode(cart) {
            userDefaults.set(data, forKey: shoppingCartKey)
            return true
        }
        return false
    }
    
    func deleteShoppingCart() -> Bool {
        userDefaults.removeObject(forKey: shoppingCartKey)
        return true
    }
    
    func updateProductQuantity(productId: String, productQuantity: Int) -> Bool {
        // TODO: Implementar
        return false
    }
    
    func updateProductShoppingCart(product: ProductListDTO, lam: ProductListDTO?, quantity: Int, presentationIdSelected: Int) -> Bool {
        // TODO: Implementar
        return false
    }
    
    func getSliderBanners() async throws -> SliderBannerDTO {
        // TODO: Implementar
        throw NSError(domain: "ProductLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func saveFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest {
        // TODO: Implementar
        throw NSError(domain: "ProductLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func deleteFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest {
        // TODO: Implementar
        throw NSError(domain: "ProductLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getProductDetail(idProduct: String) async throws -> ProductListDTO {
        // TODO: Implementar
        throw NSError(domain: "ProductLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func checkProductFractionalMode(productId: String) -> Bool {
        // TODO: Implementar
        return false
    }
    
    func getShoppingCartSize() -> Int {
        return getShoppingCart().count
    }
    
    func updateFractionalMode(productId: String, presentationIdSelected: Int) -> Bool {
        // TODO: Implementar
        return false
    }
    
    func getRelatedProduct(idProduct: String) async throws -> RelatedProductDTO {
        // TODO: Implementar
        throw NSError(domain: "ProductLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getFavorite() async throws -> FavoriteDTO {
        // TODO: Implementar
        throw NSError(domain: "ProductLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getProductQuantity(productId: String) -> Int {
        let cart = getShoppingCart()
        return cart.first { $0.product?.id == productId }?.quantity ?? 0
    }
    
    func getProductsById(productIds: [String]) async throws -> [ProductListDTO] {
        // TODO: Implementar
        return []
    }
    
    func getCoinpurseDashboard() async throws -> [DashboardItemDTO] {
        // TODO: Implementar
        return []
    }
}
