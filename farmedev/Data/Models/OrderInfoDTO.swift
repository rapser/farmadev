//
//  OrderInfoDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct OrderInfoDTO: Codable {
    let shoppingCartId: String?
    let shoppingCartStatus: String?
    let shoppingCartStatusid: String?
    let deliveryTime: Int?
    let deliveryCost: Double?
    let totalCost: Double?
    let discountApplied: Double?
    let orderDate: Double?
    let deliveryType: String?
    let deliveryTypeDescription: String?
    let pickupAddress: String?
    let orderDateConfirm: String?
    let paymentMethod: PaymentMethodResumeDTO?
    let address: AddressItemDTO?
    let personToPickUp: UserPickUpDTO?
}
