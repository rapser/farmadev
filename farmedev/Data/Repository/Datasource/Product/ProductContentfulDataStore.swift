//
//  ProductContentfulDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ProductContentfulDataStore: ProductDataStore {
    
    func getDashboard() async throws -> [DashboardItemDTO] {
        // TODO: Implementar llamada a Contentful API
        throw NSError(domain: "ProductContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func saveDashboard(dashboard: [DashboardItemDTO]) async throws -> [DashboardItemDTO] {
        // TODO: Implementar
        throw NSError(domain: "ProductContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getAndSaveConfig() async throws -> ContentConfigDTO {
        // TODO: Implementar llamada a Contentful API
        throw NSError(domain: "ProductContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getSliderCategory() async throws -> [SliderCategoryDTO] {
        // TODO: Implementar llamada a Contentful API
        throw NSError(domain: "ProductContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getLandingList(keyword: String) async throws -> LandingListDTO {
        // TODO: Implementar
        throw NSError(domain: "ProductContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getShoppingCart() -> [ShoppingCartItemDTO] {
        return []
    }
    
    func addProductShoppingCart(product: ProductDashboardDTO, quantity: Int, presentationIdSelected: Int) -> Bool {
        return false
    }
    
    func addProductShoppingCart(product: ProductListDTO, lam: ProductListDTO?, quantity: Int, presentationIdSelected: Int) -> Bool {
        return false
    }
    
    func checkProductShoppingCart(productId: String) -> Bool {
        return false
    }
    
    func deleteProductShoppingCart(productId: String) -> Bool {
        return false
    }
    
    func deleteShoppingCart() -> Bool {
        return false
    }
    
    func updateProductQuantity(productId: String, productQuantity: Int) -> Bool {
        return false
    }
    
    func updateProductShoppingCart(product: ProductListDTO, lam: ProductListDTO?, quantity: Int, presentationIdSelected: Int) -> Bool {
        return false
    }
    
    func getSliderBanners() async throws -> SliderBannerDTO {
        // TODO: Implementar
        throw NSError(domain: "ProductContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func saveFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest {
        // TODO: Implementar
        throw NSError(domain: "ProductContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func deleteFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest {
        // TODO: Implementar
        throw NSError(domain: "ProductContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getProductDetail(idProduct: String) async throws -> ProductListDTO {
        // TODO: Implementar
        throw NSError(domain: "ProductContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func checkProductFractionalMode(productId: String) -> Bool {
        return false
    }
    
    func getShoppingCartSize() -> Int {
        return 0
    }
    
    func updateFractionalMode(productId: String, presentationIdSelected: Int) -> Bool {
        return false
    }
    
    func getRelatedProduct(idProduct: String) async throws -> RelatedProductDTO {
        // TODO: Implementar
        throw NSError(domain: "ProductContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getFavorite() async throws -> FavoriteDTO {
        // TODO: Implementar
        throw NSError(domain: "ProductContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getProductQuantity(productId: String) -> Int {
        return 0
    }
    
    func getProductsById(productIds: [String]) async throws -> [ProductListDTO] {
        // TODO: Implementar
        throw NSError(domain: "ProductContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getCoinpurseDashboard() async throws -> [DashboardItemDTO] {
        // TODO: Implementar
        throw NSError(domain: "ProductContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
}
