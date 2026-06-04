//
//  OrderUseCase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class OrderUseCase {
    
    private let orderRepository: OrderRepository
    
    init(orderRepository: OrderRepository) {
        self.orderRepository = orderRepository
    }

    func getListAddress() async throws -> [AddressItem] {
        try await orderRepository.getListAddress()
    }
    
    func updateShoppingCart(_ updateRequest: UpdateCartRequest) async throws -> ShoppingCart {
        try await orderRepository.updateShoppingCart(request: updateRequest)
    }
    
    func getDiscounts() -> [Discount] {
        orderRepository.getDiscounts()
    }

    func getDeliveryInfo(isOldVersion: String) async throws -> DeliveryInfo {
        try await orderRepository.getDeliveryInfo(isOldVersion: isOldVersion)
    }
    
    func getDeliveryInfoSchedule(addressId: Int, messageDay: String, today: String, deliveryTypeId: String, isOldVersion: String) async throws -> Element {
        try await orderRepository.getDeliveryInfoSchedule(
            addressId: addressId,
            messageDay: messageDay,
            today: today,
            deliveryTypeId: deliveryTypeId,
            isOldVersion: isOldVersion
        )
    }
    
    func getDeliveryInfoSchedule(deliveryTypeId: String, drugstoreId: String, isOldVersion: String) async throws -> Element {
        try await orderRepository.getDeliveryInfoSchedule(
            deliveryTypeId: deliveryTypeId,
            drugstoreId: drugstoreId,
            isOldVersion: isOldVersion
        )
    }
    
    func getDeliveryInfo(deliveryTypeId: String, isOldVersion: String) async throws -> DeliveryInfo {
        try await orderRepository.getDeliveryInfo(deliveryTypeId: deliveryTypeId, isOldVersion: isOldVersion)
    }

    func getDeliveryInfo(deliveryTypeId: String, drugstoreId: String, isOldVersion: String) async throws -> DeliveryInfo {
        try await orderRepository.getDeliveryInfo(deliveryTypeId: deliveryTypeId, drugstoreId: drugstoreId, isOldVersion: isOldVersion)
    }
    
    func getDeliverySchedule(messageDay: String, messageHour: String, zoneId: Int, scheduleId: Int, isOldVersion: String) async throws -> MessageError {
        try await orderRepository.getDeliverySchedule(
            messageDay: messageDay,
            messageHour: messageHour,
            zoneId: zoneId,
            scheduleId: scheduleId,
            isOldVersion: isOldVersion
        )
    }
    
    func cartConfirmation(request: CartConfirmation) async throws -> ConfirmCart {
        try await orderRepository.cartConfirmation(request: request)
    }
    
    func getCancelListOrder() async throws -> CancelListOrder {
        try await orderRepository.getCancelListOrder()
    }
    
    func verifyStatusCanceled(idOrder: String) async throws -> CancelOrder {
        try await orderRepository.verifyStatusCanceled(idOrder: idOrder)
    }
    
    func getActiveOrders() async throws -> [Order] {
        try await orderRepository.getActiveOrders()
    }
    
    func getActiveOrdersLite() async throws -> [Order] {
        try await orderRepository.getActiveOrdersLite()
    }
    
    func getMotorized(idMotorized: String) async throws -> Motorized {
        try await orderRepository.getMotorized(idMotorized: idMotorized)
    }
    
    func getMotorizedLite(idMotorized: String) async throws -> Motorized {
        try await orderRepository.getMotorizedLite(idMotorized: idMotorized)
    }
    
    func cancelOrder(order: Order, reason: CancelReason) -> Bool {
        orderRepository.cancelOrder(order: order, reason: reason)
    }
    
    func getOrderHistory() async throws -> OrderList {
        try await orderRepository.getOrderHistory()
    }
    
    func getAntifraudInfo(shoppingCartId: Int) async throws -> AntifraudInfo {
        try await orderRepository.getAntifraudInfo(shoppingCartId: shoppingCartId)
    }
    
    func getPurchaseNumber(request: PurchaseRequest) async throws -> PurchaseResponse {
        try await orderRepository.getPurchaseNumber(request: request)
    }
    
    func updatePurchaseNumber(request: PurchaseStatusRequest) async throws -> Bool {
        try await orderRepository.updatePurchaseNumber(request: request)
    }
    
    func getNearDrugstoreOne(request: NearDrugstoreRequest) async throws -> [NearDrugstore] {
        try await orderRepository.getNearDrugstoreOne(request: request)
    }
    
    func getNearDrugstore(request: NearDrugstoreRequest) async throws -> [NearDrugstore] {
        try await orderRepository.getNearDrugstore(request: request)
    }
    
    func getPickOrderUser() async throws -> [UserPickUp] {
        try await orderRepository.getPickOrderUser()
    }
    
    func registerPickOrderUser(request: UserPickUp) async throws -> Bool {
        try await orderRepository.registerPickOrderUser(request: request)
    }
    
    func updatePickOrderUser(request: UserPickUp, id: Int) async throws -> Bool {
        try await orderRepository.updatePickOrderUser(request: request, id: id)
    }
    
    func deletePickOrderUser(id: Int) async throws -> Bool {
        try await orderRepository.deletePickOrderUser(id: id)
    }
    
    func favoritePickOrderUser(id: Int) async throws -> Bool {
        try await orderRepository.favoritePickOrderUser(id: id)
    }
    
    func updatePayOnline(request: PayOnlineUpdateRequest) async throws -> Bool {
        try await orderRepository.updatePayOnline(request: request)
    }
    
    func validateRuc(ruc: String) async throws -> RucResponse {
        try await orderRepository.validateRuc(ruc: ruc)
    }
}
