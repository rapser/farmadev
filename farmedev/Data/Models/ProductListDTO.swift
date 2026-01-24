//
//  ProductListDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct ProductListDTO: Codable {
    let id: String?
    let name: String?
    let brand: String?
    let subTotal: Double?
    let shortDescription: String?
    let longDescription: String?
    let imageList: [UrlStringListDTO]?
    let price: Double?
    let fractionatedPrice: Double?
    let unitPriceSelected: Double?
    let prescription: String?
    let precautions: String?
    let sideEffects: String?
    let howToConsume: String?
    let type: String?
    let tag: String?
    let favorite: Bool?
    let presentation: String?
    let concentration: String?
    let fractionalMode: Bool?
    let quantity: Int?
    let activePrinciples: [String]?
    let fractionatedForm: String?
    let fractionatedText: String?
    let noFractionatedText: String?
    let productStatusId: Int?
    let productStatus: String?
    let quantityUnits: Int?
    let maxUnitSale: Int?
    let maxUnitSaleFractionated: Int?
    let stock: Int?
    let fractionalStock: Int?
    let showStockAlert: String?
    let presentationIdSelected: Int?
    let fractionatedFormSelect: String?
    let quantitySelected: Int?
    let limitOfferTime: String?
    let defaultPresentation: Bool?
    let fractionatedPresentationId: Int?
    let presentationId: Int?
    let skuVariants: [VariantDTO]?
    let details: [ProductDetailsDTO]?
    let categoryList: [GroupCategoryDTO]?
    let tagImageUrl: String?
    let alertTagText: String?
    let priceAllPaymentMethod: Double?
    let fractionatedPriceAllPaymentMethod: Double?
    let priceWithpaymentMethod: Double?
    let fractionatedPriceWithpaymentMethod: Double?
    let crossOutPL: Bool?
    let crossOutFractionatedPL: Bool?
    let paymentMethodCardType: String?
    let subTotalAllPaymentMethod: Double?
    let subTotalWithPaymentMethod: Double?
    
    // Modelos auxiliares incluidos directamente
    struct VariantDTO: Codable {
        let sku: String?
        let name: String?
        let type: String?
        let code: String?
        let hasStock: Bool?
        let imageUrl: String?
    }
    
    struct ProductDetailsDTO: Codable {
        let key: String?
        let title: String?
        let content: String?
        let order: Int?
    }
    
    struct UrlStringListDTO: Codable {
        let url: String?
        let thumbnails: [String]?
    }
}
