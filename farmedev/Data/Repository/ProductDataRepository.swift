//
//  ProductDataRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ProductDataRepository: ProductRepository {
    
    private let productDataStoreFactory: ProductDataStoreFactory
    private let sessionDataStoreFactory: SessionDataStoreFactory
    
    init(productDataStoreFactory: ProductDataStoreFactory, sessionDataStoreFactory: SessionDataStoreFactory) {
        self.productDataStoreFactory = productDataStoreFactory
        self.sessionDataStoreFactory = sessionDataStoreFactory
    }
    
    func getDashboard() async throws -> [DashboardItem] {
        let contentfulDataStore = productDataStoreFactory.createContentful()
        let dashboardDTOs = try await contentfulDataStore.getDashboard()
        return dashboardDTOs.compactMap { $0.toDomain() }
    }
    
    func getDashboardOffline() async throws -> [DashboardItem] {
        let localDataStore = productDataStoreFactory.createLocal()
        let dashboardDTOs = try await localDataStore.getDashboard()
        return dashboardDTOs.compactMap { $0.toDomain() }
    }
    
    func getAndSaveConfig() async throws -> Bool {
        let contentfulDataStore = productDataStoreFactory.createContentful()
        let sessionDataStore = sessionDataStoreFactory.createLocal()
        let contentConfigDTO = try await contentfulDataStore.getAndSaveConfig()
        let contentConfig = contentConfigDTO.toDomain()
        _ = try await sessionDataStore.saveContentConfig(contentConfig: contentConfig)
        return true
    }
    
    func getSliderCategory() async throws -> [SliderCategory] {
        let contentfulDataStore = productDataStoreFactory.createContentful()
        let sliderCategoryDTOs = try await contentfulDataStore.getSliderCategory()
        return sliderCategoryDTOs.map { $0.toDomain() }
    }
    
    func getLandingList(keyword: String) async throws -> LandingList {
        let contentfulDataStore = productDataStoreFactory.createContentful()
        let cloudDataStore = productDataStoreFactory.createCloud()
        
        let landingListDTO = try await contentfulDataStore.getLandingList(keyword: keyword)
        let productIds = landingListDTO.products?.map { $0.id ?? "" } ?? []
        let productsDTO = try await cloudDataStore.getProductsById(productIds: productIds)
        
        // Combinar landingListDTO con productsDTO completos
        let combinedLandingListDTO = LandingListDTO(
            title: landingListDTO.title,
            deepLink: landingListDTO.deepLink,
            itemsPerView: landingListDTO.itemsPerView,
            products: productsDTO
        )
        
        return combinedLandingListDTO.toDomain()
    }
    
    func addProductShoppingCart(product: ProductDashboard, quantity: Int, presentationIdSelected: Int) -> Bool {
        let localDataStore = productDataStoreFactory.createLocal()
        // TODO: Crear mapper ProductDashboard -> ProductDashboardDTO
        // Por ahora, usar un constructor directo básico
        let productDTO = ProductDashboardDTO(
            id: product.id,
            lam: product.lam,
            name: product.name,
            favorite: product.favorite,
            productStatusId: product.productStatusId,
            pathImage: product.pathImage,
            stockAlert: product.stockAlert,
            fractionalMode: product.fractionalMode,
            fractionalStock: product.fractionalStock,
            packStock: product.packStock,
            fractionalPrice: product.fractionalPrice,
            packPrice: product.packPrice,
            packPresentation: product.packPresentation,
            fractionalPresentation: product.fractionalPresentation,
            fractionalDescription: product.fractionalDescription,
            unitQuantity: product.unitQuantity,
            packDescription: product.packDescription,
            maxfractionalUnitSale: product.maxfractionalUnitSale,
            maxPackUnitSale: product.maxPackUnitSale,
            limitOfferTime: product.limitOfferTime,
            defaultPresentation: product.defaultPresentation,
            shortDescription: product.shortDescription,
            longDescription: product.longDescription,
            fractionatedPresentationId: product.fractionatedPresentationId,
            presentationId: product.presentationId,
            alertTagText: product.alertTagText,
            tagImageUrl: product.tagImageUrl,
            prescription: product.prescription,
            priceAllPaymentMethod: product.priceAllPaymentMethod,
            fractionatedPriceAllPaymentMethod: product.fractionatedPriceAllPaymentMethod,
            priceWithpaymentMethod: product.priceWithpaymentMethod,
            fractionatedPriceWithpaymentMethod: product.fractionatedPriceWithpaymentMethod,
            crossOutPL: product.crossOutPL,
            crossOutFractionatedPL: product.crossOutFractionatedPL,
            paymentMethodCardType: product.paymentMethodCardType
        )
        return localDataStore.addProductShoppingCart(product: productDTO, quantity: quantity, presentationIdSelected: presentationIdSelected)
    }
    
    func addProductShoppingCart(product: ProductList, lam: ProductList?, quantity: Int, presentationIdSelected: Int) -> Bool {
        let localDataStore = productDataStoreFactory.createLocal()
        // TODO: Crear mapper ProductList -> ProductListDTO
        // Por ahora, usar un constructor directo básico
        let productDTO = ProductListDTO(
            id: product.id,
            name: product.name,
            brand: product.brand,
            subTotal: product.subTotal,
            shortDescription: product.shortDescription,
            longDescription: product.longDescription,
            imageList: product.imageList.map { ProductListDTO.UrlStringListDTO(url: $0.url, thumbnails: $0.thumbnails) },
            price: product.price,
            fractionatedPrice: product.fractionatedPrice,
            unitPriceSelected: product.unitPriceSelected,
            prescription: product.prescription,
            precautions: product.precautions,
            sideEffects: product.sideEffects,
            howToConsume: product.howToConsume,
            type: product.type,
            tag: product.tag,
            favorite: product.favorite,
            presentation: product.presentation,
            concentration: product.concentration,
            fractionalMode: product.fractionalMode,
            quantity: product.quantity,
            activePrinciples: product.activePrinciples,
            fractionatedForm: product.fractionatedForm,
            fractionatedText: product.fractionatedText,
            noFractionatedText: product.noFractionatedText,
            productStatusId: product.productStatusId,
            productStatus: product.productStatus,
            quantityUnits: product.quantityUnits,
            maxUnitSale: product.maxUnitSale,
            maxUnitSaleFractionated: product.maxUnitSaleFractionated,
            stock: product.stock,
            fractionalStock: product.fractionalStock,
            showStockAlert: product.showStockAlert,
            presentationIdSelected: product.presentationIdSelected,
            fractionatedFormSelect: product.fractionatedFormSelect,
            quantitySelected: product.quantitySelected,
            limitOfferTime: product.limitOfferTime,
            defaultPresentation: product.defaultPresentation,
            fractionatedPresentationId: product.fractionatedPresentationId,
            presentationId: product.presentationId,
            skuVariants: nil, // TODO: Mapear si existe
            details: nil, // TODO: Mapear si existe
            categoryList: nil, // TODO: Mapear si existe
            tagImageUrl: product.tagImageUrl,
            alertTagText: product.alertTagText,
            priceAllPaymentMethod: product.priceAllPaymentMethod,
            fractionatedPriceAllPaymentMethod: product.fractionatedPriceAllPaymentMethod,
            priceWithpaymentMethod: product.priceWithpaymentMethod,
            fractionatedPriceWithpaymentMethod: product.fractionatedPriceWithpaymentMethod,
            crossOutPL: product.crossOutPL,
            crossOutFractionatedPL: product.crossOutFractionatedPL,
            paymentMethodCardType: product.paymentMethodCardType,
            subTotalAllPaymentMethod: nil, // TODO: Mapear si existe
            subTotalWithPaymentMethod: nil // TODO: Mapear si existe
        )
        let lamDTO: ProductListDTO? = lam != nil ? ProductListDTO(
            id: lam!.id,
            name: lam!.name,
            brand: lam!.brand,
            subTotal: lam!.subTotal,
            shortDescription: lam!.shortDescription,
            longDescription: lam!.longDescription,
            imageList: lam!.imageList.map { ProductListDTO.UrlStringListDTO(url: $0.url, thumbnails: $0.thumbnails) },
            price: lam!.price,
            fractionatedPrice: lam!.fractionatedPrice,
            unitPriceSelected: lam!.unitPriceSelected,
            prescription: lam!.prescription,
            precautions: lam!.precautions,
            sideEffects: lam!.sideEffects,
            howToConsume: lam!.howToConsume,
            type: lam!.type,
            tag: lam!.tag,
            favorite: lam!.favorite,
            presentation: lam!.presentation,
            concentration: lam!.concentration,
            fractionalMode: lam!.fractionalMode,
            quantity: lam!.quantity,
            activePrinciples: lam!.activePrinciples,
            fractionatedForm: lam!.fractionatedForm,
            fractionatedText: lam!.fractionatedText,
            noFractionatedText: lam!.noFractionatedText,
            productStatusId: lam!.productStatusId,
            productStatus: lam!.productStatus,
            quantityUnits: lam!.quantityUnits,
            maxUnitSale: lam!.maxUnitSale,
            maxUnitSaleFractionated: lam!.maxUnitSaleFractionated,
            stock: lam!.stock,
            fractionalStock: lam!.fractionalStock,
            showStockAlert: lam!.showStockAlert,
            presentationIdSelected: lam!.presentationIdSelected,
            fractionatedFormSelect: lam!.fractionatedFormSelect,
            quantitySelected: lam!.quantitySelected,
            limitOfferTime: lam!.limitOfferTime,
            defaultPresentation: lam!.defaultPresentation,
            fractionatedPresentationId: lam!.fractionatedPresentationId,
            presentationId: lam!.presentationId,
            skuVariants: nil,
            details: nil,
            categoryList: nil,
            tagImageUrl: lam!.tagImageUrl,
            alertTagText: lam!.alertTagText,
            priceAllPaymentMethod: lam!.priceAllPaymentMethod,
            fractionatedPriceAllPaymentMethod: lam!.fractionatedPriceAllPaymentMethod,
            priceWithpaymentMethod: lam!.priceWithpaymentMethod,
            fractionatedPriceWithpaymentMethod: lam!.fractionatedPriceWithpaymentMethod,
            crossOutPL: lam!.crossOutPL,
            crossOutFractionatedPL: lam!.crossOutFractionatedPL,
            paymentMethodCardType: lam!.paymentMethodCardType,
            subTotalAllPaymentMethod: nil,
            subTotalWithPaymentMethod: nil
        ) : nil
        return localDataStore.addProductShoppingCart(product: productDTO, lam: lamDTO, quantity: quantity, presentationIdSelected: presentationIdSelected)
    }
    
    func checkProductShoppingCart(productId: String) -> Bool {
        let localDataStore = productDataStoreFactory.createLocal()
        return localDataStore.checkProductShoppingCart(productId: productId)
    }
    
    func deleteProductShoppingCart(productId: String) -> Bool {
        let localDataStore = productDataStoreFactory.createLocal()
        return localDataStore.deleteProductShoppingCart(productId: productId)
    }
    
    func deleteShoppingCart() -> Bool {
        let localDataStore = productDataStoreFactory.createLocal()
        return localDataStore.deleteShoppingCart()
    }
    
    func getShoppingCart() -> [ShoppingCartItem] {
        let localDataStore = productDataStoreFactory.createLocal()
        let shoppingCartItemDTOs = localDataStore.getShoppingCart()
        return shoppingCartItemDTOs.map { $0.toDomain() }
    }
    
    func updateProductQuantity(productId: String, productQuantity: Int) -> Bool {
        let localDataStore = productDataStoreFactory.createLocal()
        return localDataStore.updateProductQuantity(productId: productId, productQuantity: productQuantity)
    }
    
    func updateProductShoppingCart(product: Product, lam: Product?, quantity: Int, presentationIdSelected: Int) -> Bool {
        // TODO: Implementar conversión Product -> ProductListDTO
        // Por ahora, este método requiere una conversión más compleja
        return false
    }
    
    func getSliderBanners() async throws -> SliderBanner {
        let cloudDataStore = productDataStoreFactory.createCloud()
        let sliderBannerDTO = try await cloudDataStore.getSliderBanners()
        return sliderBannerDTO.toDomain()
    }
    
    func saveFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest {
        let localDataStore = productDataStoreFactory.createLocal()
        let cloudDataStore = productDataStoreFactory.createCloud()
        
        let _ = try await cloudDataStore.saveFavoriteProduct(request: request)
        let _ = try await localDataStore.saveFavoriteProduct(request: request)
        return request
    }
    
    func deleteFavoriteProduct(request: FavoriteRequest) async throws -> FavoriteRequest {
        let localDataStore = productDataStoreFactory.createLocal()
        let cloudDataStore = productDataStoreFactory.createCloud()
        
        let _ = try await cloudDataStore.deleteFavoriteProduct(request: request)
        let _ = try await localDataStore.deleteFavoriteProduct(request: request)
        return request
    }
    
    func getProductDetail(idProduct: String) async throws -> ProductList {
        let cloudDataStore = productDataStoreFactory.createCloud()
        let productListDTO = try await cloudDataStore.getProductDetail(idProduct: idProduct)
        return productListDTO.toDomain()
    }
    
    func checkProductFractionalMode(productId: String) -> Bool {
        let localDataStore = productDataStoreFactory.createLocal()
        return localDataStore.checkProductFractionalMode(productId: productId)
    }
    
    func getShoppingCartSize() -> Int {
        let localDataStore = productDataStoreFactory.createLocal()
        return localDataStore.getShoppingCartSize()
    }
    
    func updateFractionalMode(productId: String, presentationIdSelected: Int) -> Bool {
        let localDataStore = productDataStoreFactory.createLocal()
        return localDataStore.updateFractionalMode(productId: productId, presentationIdSelected: presentationIdSelected)
    }
    
    func getRelatedProduct(idProduct: String) async throws -> [RelatedProductItem] {
        let cloudDataStore = productDataStoreFactory.createCloud()
        let relatedProductDTO = try await cloudDataStore.getRelatedProduct(idProduct: idProduct)
        let relatedProduct = relatedProductDTO.toDomain()
        // Convertir RelatedProduct a [RelatedProductItem]
        return relatedProduct.itemList.compactMap { related in
            guard let list = related.list else { return nil }
            return RelatedProductItem.list(RelatedProductList(
                title: list.title,
                products: list.products
            ))
        }
    }
    
    func getFavorite() async throws -> Favorite {
        let cloudDataStore = productDataStoreFactory.createCloud()
        let favoriteDTO = try await cloudDataStore.getFavorite()
        return favoriteDTO.toDomain()
    }
    
    func getProductQuantity(productId: String) -> Int {
        let localDataStore = productDataStoreFactory.createLocal()
        return localDataStore.getProductQuantity(productId: productId)
    }
    
    func getProductsById(productIds: [String]) async throws -> [ProductList] {
        let cloudDataStore = productDataStoreFactory.createCloud()
        let productListDTOs = try await cloudDataStore.getProductsById(productIds: productIds)
        return productListDTOs.map { $0.toDomain() }
    }
    
    func getCoinpurseDashboard() async throws -> [DashboardItem] {
        let cloudDataStore = productDataStoreFactory.createCloud()
        let dashboardDTOs = try await cloudDataStore.getCoinpurseDashboard()
        return dashboardDTOs.compactMap { $0.toDomain() }
    }
}
