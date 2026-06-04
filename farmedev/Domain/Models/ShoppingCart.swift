//
//  ShoppingCart.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct ShoppingCart {
    let id: Int
    let precalculation: ShoppingCartDiscount?
    let deliveryTime: Int
    let address: Address?
    let paymentMethod: PaymentMethod?
    let listSubtotal: [SubTotal]
    let productItemList: [ProductPack]
    let requestUid: String
    let minimumPurchase: Double
    let minimumPurchaseMessage: String
    let minimumPurchaseFlag: Bool
    let code: String
    let message: String
    let discountId: Int
    let discountCode: String
    let warningMessage: String
    let warningFlag: Bool
    let discountsList: [DiscountReference]
    let defaultDelivery: Bool
    let orderType: String
    
    // Modelo auxiliar incluido directamente
    struct SubTotal {
        let name: String
        let value: Double
    }
}
