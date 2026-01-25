//
//  OrderDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol OrderDataStore {
    func updateCart(updateRequest: UpdateCartRequest) async throws -> ShoppingCartDTO
    
    func getDeliveryInfo(isOldVersion: String) async throws -> DeliveryInfoDTO
    
    func getDiscounts() -> [DiscountDTO]
    
    func getDeliveryInfoSchedule(addressId: Int, messageDay: String, today: String, deliveryTypeId: String, isOldVersion: String) async throws -> ElementDTO
    
    func getDeliveryInfoSchedule(deliveryTypeId: String, drugstoreId: String, isOldVersion: String) async throws -> ElementDTO
    
    func getDeliveryInfo(deliveryTypeId: String, isOldVersion: String) async throws -> DeliveryInfoDTO
    
    func getDeliveryInfo(deliveryTypeId: String, drugstoreId: String, isOldVersion: String) async throws -> DeliveryInfoDTO
    
    func getDeliverySchedule(messageDay: String, messageHour: String, zoneId: Int, scheduleId: Int, isOldVersion: String) async throws -> MessageErrorDTO
    
    func cartConfirmation(request: CartConfirmation) async throws -> ConfirmCartDTO
    
    func getCancelListOrder() async throws -> CancelListOrderDTO
    
    func verifyStatusCanceled(idOrder: String) async throws -> CancelOrderDTO
    
    func getActiveOrders() async throws -> [OrderDTO]
    
    func getActiveOrdersLite() async throws -> [OrderDTO]
    
    func getMotorized(idMotorized: String) async throws -> MotorizedDTO
    
    func getMotorizedLite(idMotorized: String) async throws -> MotorizedDTO
    
    func cancelOrder(urlFirebase: String, shoppingCartId: Int, id: String, reason: String) -> Bool
    
    func getOrderHistory() async throws -> OrderListDTO
    
    func getAntifraudInfo(shoppingCartId: Int) async throws -> AntifraudInfoDTO
    
    func getPurchaseNumber(request: PurchaseRequest) async throws -> PurchaseResponseDTO
    
    func updatePurchaseNumber(request: PurchaseStatusRequest) async throws -> EmptyDTO
    
    func getNearDrugstoreOne(request: NearDrugstoreRequest) async throws -> [NearDrugstoreDTO]
    
    func getNearDrugstore(request: NearDrugstoreRequest) async throws -> [NearDrugstoreDTO]
    
    func getPickOrderUser() async throws -> UserPickUpListDTO
    
    func registerPickOrderUser(request: UserPickUp) async throws -> EmptyDTO
    
    func updatePickOrderUser(request: UserPickUp, id: Int) async throws -> EmptyDTO
    
    func deletePickOrderUser(id: Int) async throws -> EmptyDTO
    
    func favoritePickOrderUser(id: Int) async throws -> EmptyDTO
    
    func updatePayOnline(request: PayOnlineUpdateRequest) async throws -> EmptyDTO
    
    func validateRuc(ruc: String) async throws -> RucResponseDTO
}
