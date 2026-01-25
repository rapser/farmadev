//
//  OrderFirebaseDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class OrderFirebaseDataStore: OrderDataStore {
    
    func updateCart(updateRequest: UpdateCartRequest) async throws -> ShoppingCartDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func getDeliveryInfo(isOldVersion: String) async throws -> DeliveryInfoDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func getDiscounts() -> [DiscountDTO] {
        []
    }
    
    func getDeliveryInfoSchedule(addressId: Int, messageDay: String, today: String, deliveryTypeId: String, isOldVersion: String) async throws -> ElementDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func getDeliveryInfoSchedule(deliveryTypeId: String, drugstoreId: String, isOldVersion: String) async throws -> ElementDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func getDeliveryInfo(deliveryTypeId: String, isOldVersion: String) async throws -> DeliveryInfoDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func getDeliveryInfo(deliveryTypeId: String, drugstoreId: String, isOldVersion: String) async throws -> DeliveryInfoDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func getDeliverySchedule(messageDay: String, messageHour: String, zoneId: Int, scheduleId: Int, isOldVersion: String) async throws -> MessageErrorDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func cartConfirmation(request: CartConfirmation) async throws -> ConfirmCartDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func getCancelListOrder() async throws -> CancelListOrderDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func verifyStatusCanceled(idOrder: String) async throws -> CancelOrderDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func getActiveOrders() async throws -> [OrderDTO] {
        // TODO: Implementar obtención desde Firebase
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getActiveOrdersLite() async throws -> [OrderDTO] {
        // TODO: Implementar obtención desde Firebase
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getMotorized(idMotorized: String) async throws -> MotorizedDTO {
        // TODO: Implementar obtención desde Firebase
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getMotorizedLite(idMotorized: String) async throws -> MotorizedDTO {
        // TODO: Implementar obtención desde Firebase
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func cancelOrder(urlFirebase: String, shoppingCartId: Int, id: String, reason: String) -> Bool {
        // TODO: Implementar cancelación en Firebase
        false
    }
    
    func getOrderHistory() async throws -> OrderListDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func getAntifraudInfo(shoppingCartId: Int) async throws -> AntifraudInfoDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func getPurchaseNumber(request: PurchaseRequest) async throws -> PurchaseResponseDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func updatePurchaseNumber(request: PurchaseStatusRequest) async throws -> EmptyDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func getNearDrugstoreOne(request: NearDrugstoreRequest) async throws -> [NearDrugstoreDTO] {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func getNearDrugstore(request: NearDrugstoreRequest) async throws -> [NearDrugstoreDTO] {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func getPickOrderUser() async throws -> UserPickUpListDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func registerPickOrderUser(request: UserPickUp) async throws -> EmptyDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func updatePickOrderUser(request: UserPickUp, id: Int) async throws -> EmptyDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func deletePickOrderUser(id: Int) async throws -> EmptyDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func favoritePickOrderUser(id: Int) async throws -> EmptyDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func updatePayOnline(request: PayOnlineUpdateRequest) async throws -> EmptyDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
    
    func validateRuc(ruc: String) async throws -> RucResponseDTO {
        throw NSError(domain: "OrderFirebaseDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Firebase"])
    }
}
