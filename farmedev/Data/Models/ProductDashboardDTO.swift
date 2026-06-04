//
//  ProductDashboardDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct ProductDashboardDTO: Codable {
    let id: String?
    let lam: String?
    let name: String?
    let favorite: Bool?
    let productStatusId: Double?
    let pathImage: String?
    let stockAlert: String?
    let fractionalMode: Bool?
    let fractionalStock: Int64?
    let packStock: Int64?
    let fractionalPrice: Double?
    let packPrice: Double?
    let packPresentation: String?
    let fractionalPresentation: String?
    let fractionalDescription: String?
    let unitQuantity: Double?
    let packDescription: String?
    let maxfractionalUnitSale: Int64?
    let maxPackUnitSale: Int64?
    let limitOfferTime: String?
    let defaultPresentation: Bool?
    let shortDescription: String?
    let longDescription: String?
    let fractionatedPresentationId: Int?
    let presentationId: Int?
    let alertTagText: String?
    let tagImageUrl: String?
    let prescription: String?
    let priceAllPaymentMethod: Double?
    let fractionatedPriceAllPaymentMethod: Double?
    let priceWithpaymentMethod: Double?
    let fractionatedPriceWithpaymentMethod: Double?
    let crossOutPL: Bool?
    let crossOutFractionatedPL: Bool?
    let paymentMethodCardType: String?
}
