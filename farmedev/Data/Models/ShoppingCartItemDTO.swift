//
//  ShoppingCartItemDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct ShoppingCartItemDTO: Codable {
    let quantity: Int?
    let product: ProductDTO?
    let lam: ProductDTO?
    let presentationIdSelected: Int?
    
    // Modelo auxiliar incluido directamente (ProductEntity del Realm)
    struct ProductDTO: Codable {
        let id: String?
        let name: String?
        let shortDescription: String?
        let longDescription: String?
        let imageList: [UrlDTO]?
        let price: Double?
        let fractionatedPrice: Double?
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
        let fractionatedForm: String?
        let fractionatedText: String?
        let noFractionatedText: String?
        let productStatusId: Int?
        let productStatus: String?
        let quantityUnits: Int?
        let maxUnitSale: Int?
        let maxUnitSaleFrationated: Int?
        let stock: Int?
        let fractionalStock: Int?
        let showStockAlert: String?
        let fractionatedFormSelect: String?
        let fractionatedSelected: Bool?
        let presentationIdSelected: Int?
        let unitPriceSelected: Double?
        let quantitySelected: Int?
        let fractionatedPresentationId: Int?
        let presentationId: Int?
        let priceAllPaymentMethod: Double?
        let fractionatedPriceAllPaymentMethod: Double?
        let priceWithpaymentMethod: Double?
        let fractionatedPriceWithpaymentMethod: Double?
        let crossOutPL: Bool?
        let crossOutFractionatedPL: Bool?
        let paymentMethodCardType: String?
    }
    
    struct UrlDTO: Codable {
        let url: String?
    }
}
