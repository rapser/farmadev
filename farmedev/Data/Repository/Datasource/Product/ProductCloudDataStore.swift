//
//  ProductCloudDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ProductCloudDataStore: ProductDataStore {

    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func getDashboard() async throws -> [DashboardItemDTO] {
        let items: [MockoonDashboardItemDTO] = try await apiClient.request(
            path: "dashboard/2",
            method: .get,
            body: nil,
            queryItems: nil
        )
        return items.map { mapMockoonDashboardItemToDTO($0) }
    }

    func saveDashboard(dashboard: [DashboardItemDTO]) async throws -> [DashboardItemDTO] {
        // Mockoon does not support save; return as-is for local sync scenarios
        return dashboard
    }

    func getAndSaveConfig() async throws -> ContentConfigDTO {
        // TODO: Implement when Config Mockoon endpoint is used
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }

    func getSliderCategory() async throws -> [SliderCategoryDTO] {
        let items: [MockoonSliderCategoryItemDTO] = try await apiClient.request(
            path: "dashboard/categoryOutstanding",
            method: .get,
            body: nil,
            queryItems: nil
        )
        return items.map { item in
            SliderCategoryDTO(
                iconTitle: item.name,
                iconUrl: item.imageUrl,
                deepLink: nil,
                titleColor: nil
            )
        }
    }

    func getLandingList(keyword: String) async throws -> LandingListDTO {
        // TODO: Implement when landing/search Mockoon endpoints are wired
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
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
        let response: MockoonSlidersResponseDTO = try await apiClient.request(
            path: "dashboard/v2/sliders",
            method: .get,
            body: nil,
            queryItems: nil
        )
        let sliders = response.sliders ?? []
        let data = sliders.map { s in
            BannerListDTO(
                id: s.id,
                title: nil,
                image: s.imageUrl,
                action: s.actionUrl
            )
        }
        return SliderBannerDTO(title: nil, data: data)
    }

    func saveFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest {
        // TODO: Implement POST addtofav when needed
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }

    func deleteFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest {
        // TODO: Implement DELETE delfromfav when needed
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }

    func getProductDetail(idProduct: String) async throws -> ProductListDTO {
        // TODO: Implement GET product/:id when ProductDetail feature is built
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
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
        // TODO: Implement GET product/:id/related when needed
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }

    func getFavorite() async throws -> FavoriteDTO {
        // TODO: Implement GET favorites when Favorites feature is built
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }

    func getProductQuantity(productId: String) -> Int {
        return 0
    }

    func getProductsById(productIds: [String]) async throws -> [ProductListDTO] {
        // TODO: Implement GET products/:ids when needed
        throw NSError(domain: "ProductCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }

    func getCoinpurseDashboard() async throws -> [DashboardItemDTO] {
        return try await getDashboard()
    }

    // MARK: - Mockoon → DTO mapping

    private func mapMockoonDashboardItemToDTO(_ item: MockoonDashboardItemDTO) -> DashboardItemDTO {
        let type = item.type ?? ""
        var banner: DashboardItemDTO.DashboardBannerDTO?
        var list: DashboardItemDTO.DashboardListDTO?

        if type == "BANNER" {
            banner = DashboardItemDTO.DashboardBannerDTO(
                title: item.title,
                image: item.imageUrl,
                action: item.actionUrl,
                template: nil,
                _description: nil,
                limitOfferTime: nil
            )
        }
        if type == "PRODUCTS", let products = item.products, !products.isEmpty {
            let productForSaleList = products.map { p in
                ProductDashboardDTO(
                    id: p.id,
                    lam: nil,
                    name: p.name,
                    favorite: nil,
                    productStatusId: nil,
                    pathImage: p.imageList?.first?.url,
                    stockAlert: nil,
                    fractionalMode: nil,
                    fractionalStock: nil,
                    packStock: nil,
                    fractionalPrice: nil,
                    packPrice: nil,
                    packPresentation: nil,
                    fractionalPresentation: nil,
                    fractionalDescription: nil,
                    unitQuantity: nil,
                    packDescription: nil,
                    maxfractionalUnitSale: nil,
                    maxPackUnitSale: nil,
                    limitOfferTime: nil,
                    defaultPresentation: nil,
                    shortDescription: nil,
                    longDescription: nil,
                    fractionatedPresentationId: nil,
                    presentationId: nil,
                    alertTagText: nil,
                    tagImageUrl: nil,
                    prescription: nil,
                    priceAllPaymentMethod: p.price,
                    fractionatedPriceAllPaymentMethod: nil,
                    priceWithpaymentMethod: nil,
                    fractionatedPriceWithpaymentMethod: nil,
                    crossOutPL: nil,
                    crossOutFractionatedPL: nil,
                    paymentMethodCardType: nil
                )
            }
            list = DashboardItemDTO.DashboardListDTO(
                title: item.title,
                deepLink: nil,
                name: nil,
                productForSaleList: productForSaleList,
                products: nil,
                itemsPerView: nil
            )
        }

        return DashboardItemDTO(
            type: type,
            backgroundColor: nil,
            titleColor: nil,
            banner: banner,
            list: list,
            bannerList: nil,
            sliderList: nil,
            bannerKit: nil,
            wordList: nil
        )
    }
}
