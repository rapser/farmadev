//
//  ProductRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol ProductRepository {
    func getDashboard() async throws -> [DashboardItem]
    
    func getDashboardOffline() async throws -> [DashboardItem]
    
    func getAndSaveConfig() async throws -> Bool
    
    func getSliderCategory() async throws -> [SliderCategory]

    func getLandingList(keyword: String) async throws -> LandingList
    
    func addProductShoppingCart(product: ProductDashboard, quantity: Int, presentationIdSelected: Int) -> Bool
    
    func addProductShoppingCart(product: ProductList, lam: ProductList?, quantity: Int, presentationIdSelected: Int) -> Bool
    
    func checkProductShoppingCart(productId: String) -> Bool
    
    func deleteProductShoppingCart(productId: String) -> Bool
    
    func deleteShoppingCart() -> Bool
    
    func getShoppingCart() -> [ShoppingCartItem]
    
    func updateProductQuantity(productId: String, productQuantity: Int) -> Bool
    
    func updateProductShoppingCart(product: Product, lam: Product?, quantity: Int, presentationIdSelected: Int) -> Bool
    
    func getSliderBanners() async throws -> SliderBanner
    
    func saveFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest
    
    func deleteFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest
    
    func getProductDetail(idProduct: String) async throws -> ProductList
    
    func checkProductFractionalMode(productId: String) -> Bool
    
    func getShoppingCartSize() -> Int
    
    func updateFractionalMode(productId: String, presentationIdSelected: Int) -> Bool
    
    func getRelatedProduct(idProduct: String) async throws -> [RelatedProductItem]
    
    func getFavorite() async throws -> Favorite
    
    func getProductQuantity(productId: String) -> Int
    
    func getProductsById(productIds: [String]) async throws -> [ProductList]
    
    func getCoinpurseDashboard() async throws -> [DashboardItem]
}
