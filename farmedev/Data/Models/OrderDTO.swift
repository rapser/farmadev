//
//  OrderDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct OrderDTO: Codable {
    let shoppingCartId: Int?
    let shoppingCartStatus: String?
    let shoppingCartStatusId: Int?
    let orderStatus: [OrderStatusDTO]?
    let deliveryTime: Int?
    let subtotal: Double?
    let deliveryCost: Double?
    let totalRounding: Double?
    let totalCost: Double?
    let discountApplied: Double?
    let orderNote: String?
    let address: AddressDTO?
    let productList: [OrderProductDTO]?
    let paymentMethod: PaymentMethodDTO?
    let orderDate: Int?
    let deliveryDate: Int?
    let tracking: Bool?
    let programmedMessage: String?
    let scheduledStartDate: Int?
    let scheduledEndDate: Int?
    let deliveryStartDate: Int?
    let deliveryEndDate: Int?
    let motorizedId: String?
    let drugstore: DrugstoreDTO?
    let shopingCartStatusDate: Int?
    let comesFromScheduled: Bool?
    let group: GroupDTO?
    let voucherType: String?
    let company: VoucherCompanyDTO?
    let pickupAddress: String?
    let deliveryType: String?
    let deliveryService: Int?
    let end: String?
    let urlFirebase: String?
    let personToPickUp: UserPickUpDTO?
    let subTotalWithNoSpecificPaymentMethod: Double?
    let totalWithNoSpecificPaymentMethod: Double?
    let totalWithPaymentMethod: Double?
    let paymentMethodCardType: String?
    
    // Modelos auxiliares incluidos directamente
    struct OrderStatusDTO: Codable {
        let id: Int?
        let name: String?
        let date: Int?
        let code: String?
    }
    
    struct OrderProductDTO: Codable {
        let productPack: ProductPackDTO?
        let quantity: Int?
        let unitPrice: Double?
        let fractionalMode: Bool?
        let presentationIdSelected: Int?
    }
    
    struct DrugstoreDTO: Codable {
        let address: String?
        let description: String?
        let id: Int?
        let latitude: Double?
        let longitude: Double?
        let name: String?
        let zone: [ZoneDTO]?
    }
    
    struct ZoneDTO: Codable {
        let id: Int?
    }
    
    struct GroupDTO: Codable {
        let inProcess: String?
        let name: String?
        let order: Int?
        let previous: [PreviousMetadataDTO]?
    }
    
    struct PreviousMetadataDTO: Codable {
        let latitude: Double?
        let longitude: Double?
        let order: Int?
        let finalized: String?
        let id: Int?
    }
}
