//
//  OrderRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol OrderRepository {
    func getListAddress() async throws -> [AddressItem]
    
    func updateShoppingCart(request: UpdateCartRequest) async throws -> ShoppingCart
    
    func getDiscounts() -> [Discount]
    
    func getDeliveryInfo(isOldVersion: String) async throws -> DeliveryInfo
    
    func getDeliveryInfoSchedule(addressId: Int, messageDay: String, today: String, deliveryTypeId: String, isOldVersion: String) async throws -> Element
    
    func getDeliveryInfoSchedule(deliveryTypeId: String, drugstoreId: String, isOldVersion: String) async throws -> Element
    
    func getDeliveryInfo(deliveryTypeId: String, isOldVersion: String) async throws -> DeliveryInfo
    
    func getDeliveryInfo(deliveryTypeId: String, drugstoreId: String, isOldVersion: String) async throws -> DeliveryInfo
    
    func getDeliverySchedule(messageDay: String, messageHour: String, zoneId: Int, scheduleId: Int, isOldVersion: String) async throws -> MessageError
    
    func cartConfirmation(request: CartConfirmation) async throws -> ConfirmCart

    func getCancelListOrder() async throws -> CancelListOrder
    
    func verifyStatusCanceled(idOrder: String) async throws -> CancelOrder

    func getActiveOrders() async throws -> [Order]
    
    func getActiveOrdersLite() async throws -> [Order]
    
    func cancelOrder(order: Order, reason: CancelReason) -> Bool
    
    func getMotorized(idMotorized: String) async throws -> Motorized
    
    func getMotorizedLite(idMotorized: String) async throws -> Motorized
    
    func getOrderHistory() async throws -> OrderList
    
    func getAntifraudInfo(shoppingCartId: Int) async throws -> AntifraudInfo
    
    func getPurchaseNumber(request: PurchaseRequest) async throws -> PurchaseResponse
    
    func updatePurchaseNumber(request: PurchaseStatusRequest) async throws -> Bool
    
    func getNearDrugstoreOne(request: NearDrugstoreRequest) async throws -> [NearDrugstore]
    
    func getNearDrugstore(request: NearDrugstoreRequest) async throws -> [NearDrugstore]
    
    func getPickOrderUser() async throws -> [UserPickUp]
    
    func registerPickOrderUser(request: UserPickUp) async throws -> Bool
    
    func updatePickOrderUser(request: UserPickUp, id: Int) async throws -> Bool
    
    func deletePickOrderUser(id: Int) async throws -> Bool
    
    func favoritePickOrderUser(id: Int) async throws -> Bool
    
    func updatePayOnline(request: PayOnlineUpdateRequest) async throws -> Bool
    
    func validateRuc(ruc: String) async throws -> RucResponse
}
