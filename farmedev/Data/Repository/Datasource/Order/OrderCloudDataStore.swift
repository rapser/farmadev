//
//  OrderCloudDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class OrderCloudDataStore: OrderDataStore {
    
    func updateCart(updateRequest: UpdateCartRequest) async throws -> ShoppingCartDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getDeliveryInfo(isOldVersion: String) async throws -> DeliveryInfoDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getDiscounts() -> [DiscountDTO] {
        // No se implementa en Cloud
        []
    }
    
    func getDeliveryInfoSchedule(addressId: Int, messageDay: String, today: String, deliveryTypeId: String, isOldVersion: String) async throws -> ElementDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getDeliveryInfoSchedule(deliveryTypeId: String, drugstoreId: String, isOldVersion: String) async throws -> ElementDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getDeliveryInfo(deliveryTypeId: String, isOldVersion: String) async throws -> DeliveryInfoDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getDeliveryInfo(deliveryTypeId: String, drugstoreId: String, isOldVersion: String) async throws -> DeliveryInfoDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getDeliverySchedule(messageDay: String, messageHour: String, zoneId: Int, scheduleId: Int, isOldVersion: String) async throws -> MessageErrorDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func cartConfirmation(request: CartConfirmation) async throws -> ConfirmCartDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getCancelListOrder() async throws -> CancelListOrderDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func verifyStatusCanceled(idOrder: String) async throws -> CancelOrderDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getActiveOrders() async throws -> [OrderDTO] {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getActiveOrdersLite() async throws -> [OrderDTO] {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getMotorized(idMotorized: String) async throws -> MotorizedDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getMotorizedLite(idMotorized: String) async throws -> MotorizedDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func cancelOrder(urlFirebase: String, shoppingCartId: Int, id: String, reason: String) -> Bool {
        // TODO: Implementar cancelación de orden
        false
    }
    
    func getOrderHistory() async throws -> OrderListDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getAntifraudInfo(shoppingCartId: Int) async throws -> AntifraudInfoDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getPurchaseNumber(request: PurchaseRequest) async throws -> PurchaseResponseDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func updatePurchaseNumber(request: PurchaseStatusRequest) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getNearDrugstoreOne(request: NearDrugstoreRequest) async throws -> [NearDrugstoreDTO] {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getNearDrugstore(request: NearDrugstoreRequest) async throws -> [NearDrugstoreDTO] {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getPickOrderUser() async throws -> UserPickUpListDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func registerPickOrderUser(request: UserPickUp) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func updatePickOrderUser(request: UserPickUp, id: Int) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func deletePickOrderUser(id: Int) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func favoritePickOrderUser(id: Int) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func updatePayOnline(request: PayOnlineUpdateRequest) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func validateRuc(ruc: String) async throws -> RucResponseDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "OrderCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
}
