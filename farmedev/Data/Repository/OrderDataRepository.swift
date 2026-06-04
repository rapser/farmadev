//
//  OrderDataRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class OrderDataRepository: OrderRepository {
    
    private let orderDataStoreFactory: OrderDataStoreFactory
    
    init(orderDataStoreFactory: OrderDataStoreFactory) {
        self.orderDataStoreFactory = orderDataStoreFactory
    }
    
    func getListAddress() async throws -> [AddressItem] {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let deliveryInfoDTO = try await cloudDataStore.getDeliveryInfo(isOldVersion: "false")
        return deliveryInfoDTO.toDomain().address
    }
    
    func updateShoppingCart(request: UpdateCartRequest) async throws -> ShoppingCart {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let shoppingCartDTO = try await cloudDataStore.updateCart(updateRequest: request)
        return shoppingCartDTO.toDomain()
    }
    
    func getDiscounts() -> [Discount] {
        let localDataStore = orderDataStoreFactory.createLocal()
        return localDataStore.getDiscounts().map { $0.toDomain() }
    }
    
    func getDeliveryInfo(isOldVersion: String) async throws -> DeliveryInfo {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let deliveryInfoDTO = try await cloudDataStore.getDeliveryInfo(isOldVersion: isOldVersion)
        return deliveryInfoDTO.toDomain()
    }
    
    func getDeliveryInfoSchedule(addressId: Int, messageDay: String, today: String, deliveryTypeId: String, isOldVersion: String) async throws -> Element {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let elementDTO = try await cloudDataStore.getDeliveryInfoSchedule(addressId: addressId, messageDay: messageDay, today: today, deliveryTypeId: deliveryTypeId, isOldVersion: isOldVersion)
        return elementDTO.toDomain()
    }
    
    func getDeliveryInfoSchedule(deliveryTypeId: String, drugstoreId: String, isOldVersion: String) async throws -> Element {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let elementDTO = try await cloudDataStore.getDeliveryInfoSchedule(deliveryTypeId: deliveryTypeId, drugstoreId: drugstoreId, isOldVersion: isOldVersion)
        return elementDTO.toDomain()
    }
    
    func getDeliveryInfo(deliveryTypeId: String, isOldVersion: String) async throws -> DeliveryInfo {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let deliveryInfoDTO = try await cloudDataStore.getDeliveryInfo(deliveryTypeId: deliveryTypeId, isOldVersion: isOldVersion)
        return deliveryInfoDTO.toDomain()
    }
    
    func getDeliveryInfo(deliveryTypeId: String, drugstoreId: String, isOldVersion: String) async throws -> DeliveryInfo {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let deliveryInfoDTO = try await cloudDataStore.getDeliveryInfo(deliveryTypeId: deliveryTypeId, drugstoreId: drugstoreId, isOldVersion: isOldVersion)
        return deliveryInfoDTO.toDomain()
    }
    
    func getDeliverySchedule(messageDay: String, messageHour: String, zoneId: Int, scheduleId: Int, isOldVersion: String) async throws -> MessageError {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let messageErrorDTO = try await cloudDataStore.getDeliverySchedule(messageDay: messageDay, messageHour: messageHour, zoneId: zoneId, scheduleId: scheduleId, isOldVersion: isOldVersion)
        return messageErrorDTO.toDomain()
    }
    
    func cartConfirmation(request: CartConfirmation) async throws -> ConfirmCart {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let confirmCartDTO = try await cloudDataStore.cartConfirmation(request: request)
        return confirmCartDTO.toDomain()
    }
    
    func getCancelListOrder() async throws -> CancelListOrder {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let cancelListOrderDTO = try await cloudDataStore.getCancelListOrder()
        return cancelListOrderDTO.toDomain()
    }
    
    func verifyStatusCanceled(idOrder: String) async throws -> CancelOrder {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let cancelOrderDTO = try await cloudDataStore.verifyStatusCanceled(idOrder: idOrder)
        return cancelOrderDTO.toDomain()
    }
    
    func getActiveOrders() async throws -> [Order] {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let orderDTOs = try await cloudDataStore.getActiveOrders()
        return orderDTOs.map { $0.toDomain() }
    }
    
    func getActiveOrdersLite() async throws -> [Order] {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let orderDTOs = try await cloudDataStore.getActiveOrdersLite()
        return orderDTOs.map { $0.toDomain() }
    }
    
    func cancelOrder(order: Order, reason: CancelReason) -> Bool {
        let firebaseDataStore = orderDataStoreFactory.createFirebase()
        return firebaseDataStore.cancelOrder(urlFirebase: order.urlFirebase, shoppingCartId: order.shoppingCartId, id: reason.id, reason: reason.reason)
    }
    
    func getMotorized(idMotorized: String) async throws -> Motorized {
        let firebaseDataStore = orderDataStoreFactory.createFirebase()
        let motorizedDTO = try await firebaseDataStore.getMotorized(idMotorized: idMotorized)
        return motorizedDTO.toDomain()
    }
    
    func getMotorizedLite(idMotorized: String) async throws -> Motorized {
        let firebaseDataStore = orderDataStoreFactory.createFirebase()
        let motorizedDTO = try await firebaseDataStore.getMotorizedLite(idMotorized: idMotorized)
        return motorizedDTO.toDomain()
    }
    
    func getOrderHistory() async throws -> OrderList {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let orderListDTO = try await cloudDataStore.getOrderHistory()
        return orderListDTO.toDomain()
    }
    
    func getAntifraudInfo(shoppingCartId: Int) async throws -> AntifraudInfo {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let antifraudInfoDTO = try await cloudDataStore.getAntifraudInfo(shoppingCartId: shoppingCartId)
        return antifraudInfoDTO.toDomain()
    }
    
    func getPurchaseNumber(request: PurchaseRequest) async throws -> PurchaseResponse {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let purchaseResponseDTO = try await cloudDataStore.getPurchaseNumber(request: request)
        return purchaseResponseDTO.toDomain()
    }
    
    func updatePurchaseNumber(request: PurchaseStatusRequest) async throws -> Bool {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        _ = try await cloudDataStore.updatePurchaseNumber(request: request)
        return true
    }
    
    func getNearDrugstoreOne(request: NearDrugstoreRequest) async throws -> [NearDrugstore] {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let nearDrugstoreDTOs = try await cloudDataStore.getNearDrugstoreOne(request: request)
        return nearDrugstoreDTOs.map { $0.toDomain() }
    }
    
    func getNearDrugstore(request: NearDrugstoreRequest) async throws -> [NearDrugstore] {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let nearDrugstoreDTOs = try await cloudDataStore.getNearDrugstore(request: request)
        return nearDrugstoreDTOs.map { $0.toDomain() }
    }
    
    func getPickOrderUser() async throws -> [UserPickUp] {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let userPickUpListDTO = try await cloudDataStore.getPickOrderUser()
        return userPickUpListDTO.toDomain().peopleForStorePickup
    }
    
    func registerPickOrderUser(request: UserPickUp) async throws -> Bool {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        _ = try await cloudDataStore.registerPickOrderUser(request: request)
        return true
    }
    
    func updatePickOrderUser(request: UserPickUp, id: Int) async throws -> Bool {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        _ = try await cloudDataStore.updatePickOrderUser(request: request, id: id)
        return true
    }
    
    func deletePickOrderUser(id: Int) async throws -> Bool {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        _ = try await cloudDataStore.deletePickOrderUser(id: id)
        return true
    }
    
    func favoritePickOrderUser(id: Int) async throws -> Bool {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        _ = try await cloudDataStore.favoritePickOrderUser(id: id)
        return true
    }
    
    func updatePayOnline(request: PayOnlineUpdateRequest) async throws -> Bool {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        _ = try await cloudDataStore.updatePayOnline(request: request)
        return true
    }
    
    func validateRuc(ruc: String) async throws -> RucResponse {
        let cloudDataStore = orderDataStoreFactory.createCloud()
        let rucResponseDTO = try await cloudDataStore.validateRuc(ruc: ruc)
        return rucResponseDTO.toDomain()
    }
}
