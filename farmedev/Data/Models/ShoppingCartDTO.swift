//
//  ShoppingCartDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct ShoppingCartDTO: Codable {
    let id: Int?
    let precalculation: ShoppingCartDiscountDTO?
    let deliveryTime: Int?
    let address: AddressDTO?
    let paymentMethod: PaymentMethodDTO?
    let listSubtotal: [SubTotalDTO]?
    let productItemList: [ProductPackDTO]?
    let requestUid: String?
    let minimumPurchase: Double?
    let minimumPurchaseMessage: String?
    let minimumPurchaseFlag: Bool?
    let code: String?
    let message: String?
    let discountId: Int?
    let discountCode: String?
    let warningMessage: String?
    let warningFlag: Bool?
    let discountsList: [DiscountReferenceDTO]?
    let defaultDelivery: Bool?
    let orderType: String?
    
    // Modelo auxiliar incluido directamente
    struct SubTotalDTO: Codable {
        let name: String?
        let value: Double?
    }
}
