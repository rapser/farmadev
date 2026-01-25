//
//  ProductCloudDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ProductCloudDataStore: ProductDataStore {
    
    func getDashboard() async throws -> [DashboardItemDTO] {
        // TODO: Implementar llamada a API
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func saveDashboard(dashboard: [DashboardItemDTO]) async throws -> [DashboardItemDTO] {
        // TODO: Implementar
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getAndSaveConfig() async throws -> ContentConfigDTO {
        // TODO: Implementar
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getSliderCategory() async throws -> [SliderCategoryDTO] {
        // TODO: Implementar llamada a API
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getLandingList(keyword: String) async throws -> LandingListDTO {
        // TODO: Implementar
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getShoppingCart() -> [ShoppingCartItemDTO] {
        // TODO: Implementar
        return []
    }
    
    func addProductShoppingCart(product: ProductDashboardDTO, quantity: Int, presentationIdSelected: Int) -> Bool {
        // TODO: Implementar
        return false
    }
    
    func addProductShoppingCart(product: ProductListDTO, lam: ProductListDTO?, quantity: Int, presentationIdSelected: Int) -> Bool {
        // TODO: Implementar
        return false
    }
    
    func checkProductShoppingCart(productId: String) -> Bool {
        // TODO: Implementar
        return false
    }
    
    func deleteProductShoppingCart(productId: String) -> Bool {
        // TODO: Implementar
        return false
    }
    
    func deleteShoppingCart() -> Bool {
        // TODO: Implementar
        return false
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
        // TODO: Implementar llamada a API
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func saveFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest {
        // TODO: Implementar
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func deleteFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest {
        // TODO: Implementar
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getProductDetail(idProduct: String) async throws -> ProductListDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func checkProductFractionalMode(productId: String) -> Bool {
        // TODO: Implementar
        return false
    }
    
    func getShoppingCartSize() -> Int {
        // TODO: Implementar
        return 0
    }
    
    func updateFractionalMode(productId: String, presentationIdSelected: Int) -> Bool {
        // TODO: Implementar
        return false
    }
    
    func getRelatedProduct(idProduct: String) async throws -> RelatedProductDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getFavorite() async throws -> FavoriteDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getProductQuantity(productId: String) -> Int {
        // TODO: Implementar
        return 0
    }
    
    func getProductsById(productIds: [String]) async throws -> [ProductListDTO] {
        // TODO: Implementar llamada a API
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getCoinpurseDashboard() async throws -> [DashboardItemDTO] {
        // TODO: Implementar
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
}
