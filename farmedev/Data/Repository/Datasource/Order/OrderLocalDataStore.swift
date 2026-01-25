//
//  OrderLocalDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class OrderLocalDataStore: OrderDataStore {
    
    func updateCart(updateRequest: UpdateCartRequest) async throws -> ShoppingCartDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getDeliveryInfo(isOldVersion: String) async throws -> DeliveryInfoDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getDiscounts() -> [DiscountDTO] {
        // TODO: Implementar obtención desde almacenamiento local
        []
    }
    
    func getDeliveryInfoSchedule(addressId: Int, messageDay: String, today: String, deliveryTypeId: String, isOldVersion: String) async throws -> ElementDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getDeliveryInfoSchedule(deliveryTypeId: String, drugstoreId: String, isOldVersion: String) async throws -> ElementDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getDeliveryInfo(deliveryTypeId: String, isOldVersion: String) async throws -> DeliveryInfoDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getDeliveryInfo(deliveryTypeId: String, drugstoreId: String, isOldVersion: String) async throws -> DeliveryInfoDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getDeliverySchedule(messageDay: String, messageHour: String, zoneId: Int, scheduleId: Int, isOldVersion: String) async throws -> MessageErrorDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func cartConfirmation(request: CartConfirmation) async throws -> ConfirmCartDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getCancelListOrder() async throws -> CancelListOrderDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func verifyStatusCanceled(idOrder: String) async throws -> CancelOrderDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getActiveOrders() async throws -> [OrderDTO] {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getActiveOrdersLite() async throws -> [OrderDTO] {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getMotorized(idMotorized: String) async throws -> MotorizedDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getMotorizedLite(idMotorized: String) async throws -> MotorizedDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func cancelOrder(urlFirebase: String, shoppingCartId: Int, id: String, reason: String) -> Bool {
        // TODO: Implementar cancelación local si es necesario
        false
    }
    
    func getOrderHistory() async throws -> OrderListDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getAntifraudInfo(shoppingCartId: Int) async throws -> AntifraudInfoDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getPurchaseNumber(request: PurchaseRequest) async throws -> PurchaseResponseDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func updatePurchaseNumber(request: PurchaseStatusRequest) async throws -> EmptyDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getNearDrugstoreOne(request: NearDrugstoreRequest) async throws -> [NearDrugstoreDTO] {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getNearDrugstore(request: NearDrugstoreRequest) async throws -> [NearDrugstoreDTO] {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getPickOrderUser() async throws -> UserPickUpListDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func registerPickOrderUser(request: UserPickUp) async throws -> EmptyDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func updatePickOrderUser(request: UserPickUp, id: Int) async throws -> EmptyDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func deletePickOrderUser(id: Int) async throws -> EmptyDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func favoritePickOrderUser(id: Int) async throws -> EmptyDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func updatePayOnline(request: PayOnlineUpdateRequest) async throws -> EmptyDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func validateRuc(ruc: String) async throws -> RucResponseDTO {
        throw NSError(domain: "OrderLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
}
