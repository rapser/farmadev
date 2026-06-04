//
//  ProductList.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct ProductList {
    let id: String
    let name: String
    let brand: String
    let subTotal: Double
    let shortDescription: String
    let longDescription: String
    let imageList: [UrlStringList]
    let price: Double
    let fractionatedPrice: Double
    let unitPriceSelected: Double
    let prescription: String
    let precautions: String
    let sideEffects: String
    let howToConsume: String
    let type: String
    let tag: String
    let favorite: Bool
    let presentation: String
    let concentration: String
    let fractionalMode: Bool
    let quantity: Int
    let activePrinciples: [String]
    let fractionatedForm: String
    let fractionatedText: String
    let noFractionatedText: String
    let productStatusId: Int
    let productStatus: String
    let quantityUnits: Int
    let maxUnitSale: Int
    let maxUnitSaleFractionated: Int
    let stock: Int
    let fractionalStock: Int
    let showStockAlert: String
    let presentationIdSelected: Int
    let fractionatedFormSelect: String
    let quantitySelected: Int
    let limitOfferTime: String
    let defaultPresentation: Bool
    let fractionatedPresentationId: Int
    let presentationId: Int
    let skuVariants: [Variant]
    let details: [ProductDetails]
    let categoryList: [GroupCategory]
    let tagImageUrl: String
    let alertTagText: String
    let priceAllPaymentMethod: Double
    let fractionatedPriceAllPaymentMethod: Double
    let priceWithpaymentMethod: Double
    let fractionatedPriceWithpaymentMethod: Double
    let crossOutPL: Bool
    let crossOutFractionatedPL: Bool
    let paymentMethodCardType: String
    let subTotalAllPaymentMethod: Double
    let subTotalWithPaymentMethod: Double
    
    // Modelos auxiliares incluidos directamente
    struct Variant {
        let sku: String
        let name: String
        let type: String
        let code: String
        let hasStock: Bool
        let imageUrl: String
    }
    
    struct ProductDetails {
        let key: String
        let title: String
        let content: String
        let order: Int
    }
    
    struct UrlStringList {
        let url: String
        let thumbnails: [String]
    }
}
