//
//  ProductDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol ProductDataStore {
    func getDashboard() async throws -> [DashboardItemDTO]
    func saveDashboard(dashboard: [DashboardItemDTO]) async throws -> [DashboardItemDTO]
    func getAndSaveConfig() async throws -> ContentConfigDTO
    func getSliderCategory() async throws -> [SliderCategoryDTO]
    func getLandingList(keyword: String) async throws -> LandingListDTO
    func getShoppingCart() -> [ShoppingCartItemDTO]
    func addProductShoppingCart(product: ProductDashboardDTO, quantity: Int, presentationIdSelected: Int) -> Bool
    func addProductShoppingCart(product: ProductListDTO, lam: ProductListDTO?, quantity: Int, presentationIdSelected: Int) -> Bool
    func checkProductShoppingCart(productId: String) -> Bool
    func deleteProductShoppingCart(productId: String) -> Bool
    func deleteShoppingCart() -> Bool
    func updateProductQuantity(productId: String, productQuantity: Int) -> Bool
    func updateProductShoppingCart(product: ProductListDTO, lam: ProductListDTO?, quantity: Int, presentationIdSelected: Int) -> Bool
    func getSliderBanners() async throws -> SliderBannerDTO
    func saveFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest
    func deleteFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest
    func getProductDetail(idProduct: String) async throws -> ProductListDTO
    func checkProductFractionalMode(productId: String) -> Bool
    func getShoppingCartSize() -> Int
    func updateFractionalMode(productId: String, presentationIdSelected: Int) -> Bool
    func getRelatedProduct(idProduct: String) async throws -> RelatedProductDTO
    func getFavorite() async throws -> FavoriteDTO
    func getProductQuantity(productId: String) -> Int
    func getProductsById(productIds: [String]) async throws -> [ProductListDTO]
    func getCoinpurseDashboard() async throws -> [DashboardItemDTO]
}
