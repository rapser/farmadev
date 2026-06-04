//
//  ProductUseCase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ProductUseCase {
    
    private let productRepository: ProductRepository
    
    init(productRepository: ProductRepository) {
        self.productRepository = productRepository
    }
    
    func getDashboard() async throws -> [DashboardItem] {
        try await productRepository.getDashboard()
    }
    
    func getDashboardOffline() async throws -> [DashboardItem] {
        try await productRepository.getDashboardOffline()
    }
    
    func getAndSaveConfig() async throws -> Bool {
        try await productRepository.getAndSaveConfig()
    }
    
    func getSliderBanners() async throws -> SliderBanner {
        try await productRepository.getSliderBanners()
    }
    
    func getSliderCategory() async throws -> [SliderCategory] {
        try await productRepository.getSliderCategory()
    }

    func getLandingList(keyword: String) async throws -> LandingList {
        try await productRepository.getLandingList(keyword: keyword)
    }
    
    func addProductShoppingCart(product: ProductDashboard, quantity: Int, presentationIdSelected: Int) -> Bool {
        productRepository.addProductShoppingCart(product: product, quantity: quantity, presentationIdSelected: presentationIdSelected)
    }
    
    func checkProductShoppingCart(productId: String) -> Bool {
        productRepository.checkProductShoppingCart(productId: productId)
    }
    
    func deleteProductShoppingCart(productId: String) -> Bool {
        productRepository.deleteProductShoppingCart(productId: productId)
    }
    
    func deleteShoppingCart() -> Bool {
        productRepository.deleteShoppingCart()
    }
    
    func updateProductQuantity(productId: String, productQuantity: Int) -> Bool {
        productRepository.updateProductQuantity(productId: productId, productQuantity: productQuantity)
    }
    
    func saveFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest {
        try await productRepository.saveFavoriteProduct(request: request)
    }
    
    func deleteFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest {
        try await productRepository.deleteFavoriteProduct(request: request)
    }
    
    func getProductDetail(idProduct: String) async throws -> ProductList {
        try await productRepository.getProductDetail(idProduct: idProduct)
    }
    
    func checkProductFractionalMode(productId: String) -> Bool {
        productRepository.checkProductFractionalMode(productId: productId)
    }
    
    func getShoppingCartSize() -> Int {
        productRepository.getShoppingCartSize()
    }
    
    func addProductShoppingCart(product: ProductList, lam: ProductList?, quantity: Int, presentationIdSelected: Int) -> Bool {
        productRepository.addProductShoppingCart(product: product, lam: lam, quantity: quantity, presentationIdSelected: presentationIdSelected)
    }
    
    func updateFractionalMode(productId: String, presentationIdSelected: Int) -> Bool {
        productRepository.updateFractionalMode(productId: productId, presentationIdSelected: presentationIdSelected)
    }
    
    func getShoppingCart() -> [ShoppingCartItem] {
        productRepository.getShoppingCart()
    }
    
    func getRelatedProduct(idProduct: String) async throws -> [RelatedProductItem] {
        try await productRepository.getRelatedProduct(idProduct: idProduct)
    }
    
    func updateProductShoppingCart(product: Product, lam: Product?, quantity: Int, presentationIdSelected: Int) -> Bool {
        productRepository.updateProductShoppingCart(product: product, lam: lam, quantity: quantity, presentationIdSelected: presentationIdSelected)
    }
    
    func getFavorite() async throws -> Favorite {
        try await productRepository.getFavorite()
    }
    
    func getProductQuantity(productId: String) -> Int {
        productRepository.getProductQuantity(productId: productId)
    }
    
    func getProductsByIds(productIds: [String]) async throws -> [ProductList] {
        try await productRepository.getProductsById(productIds: productIds)
    }
    
    func getCoinpurseDashboard() async throws -> [DashboardItem] {
        try await productRepository.getCoinpurseDashboard()
    }
}
