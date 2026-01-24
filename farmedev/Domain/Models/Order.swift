//
//  Order.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct Order {
    let shoppingCartId: Int
    let shoppingCartStatus: String
    let shoppingCartStatusId: Int
    let orderStatus: [OrderStatus]
    let deliveryTime: Int
    let subtotal: Double
    let deliveryCost: Double
    let totalRounding: Double
    let totalCost: Double
    let discountApplied: Double
    let orderNote: String
    let address: Address?
    let productList: [OrderProduct]
    let paymentMethod: PaymentMethod?
    let orderDate: Int
    let deliveryDate: Int
    let tracking: Bool
    let programmedMessage: String
    let scheduledStartDate: Int
    let scheduledEndDate: Int
    let deliveryStartDate: Int
    let deliveryEndDate: Int
    let motorizedId: String
    let drugstore: Drugstore?
    let shopingCartStatusDate: Int
    let comesFromScheduled: Bool
    let group: Group?
    let voucherType: String
    let company: VoucherCompany?
    let pickupAddress: String
    let deliveryType: String
    let deliveryService: Int
    let end: String
    let urlFirebase: String
    let personToPickUp: UserPickUp?
    let subTotalWithNoSpecificPaymentMethod: Double
    let totalWithNoSpecificPaymentMethod: Double
    let totalWithPaymentMethod: Double
    let paymentMethodCardType: String
    
    // Modelos auxiliares incluidos directamente
    struct OrderStatus {
        let id: Int
        let name: String
        let date: Int
        let code: String
    }
    
    struct OrderProduct {
        let productPack: ProductPack?
        let quantity: Int
        let unitPrice: Double
        let fractionalMode: Bool
        let presentationIdSelected: Int
    }
    
    struct Drugstore {
        let address: String
        let description: String
        let id: Int
        let latitude: Double
        let longitude: Double
        let name: String
        let zone: [Zone]
    }
    
    struct Zone {
        let id: Int
    }
    
    struct Group {
        let inProcess: String
        let name: String
        let order: Int
        let previous: [PreviousMetadata]
    }
    
    struct PreviousMetadata {
        let latitude: Double
        let longitude: Double
        let order: Int
        let finalized: String
        let id: Int
    }
}
