//
//  UpdateCartRequest.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct UpdateCartRequest {
    let products: [CartProduct]
    let discountId: Int
    let deliveryType: String?
    let addressId: Int
    let paymentMethodId: Int
    let creditCardId: Int
    let currency: Int
    let amount: Double
    let schedule: ScheduleMessage?
    let discountsList: [DiscountReference]
    let discountCode: String?
    let receiptType: Int
    let company: VoucherCompany?
    let purchaseNumber: Int?
    let creditCardNumber: String?
    let idTransactionVisanet: String?
    let transactionDateVisaNet: String?
    let pickupPersonId: Int
    let drugstoreIdSelected: String?
    let defaultPaymentMethod: DefaultPaymentMethod?
    let amountPagoWeb: Double?
    let authorizationCode: String?
}

struct DefaultPaymentMethod {
    let paymentMethodCardType: String?
    let paymentMethodName: String?
}
