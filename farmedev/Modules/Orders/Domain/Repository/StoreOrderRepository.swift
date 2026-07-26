//
//  StoreOrderRepository.swift
//  farmedev
//

import Foundation

protocol StoreOrderRepository {
    func createOrder(addressLine: String, district: String, reference: String?, paymentMethod: String) async throws -> StoreOrder
    func getOrders(page: Int, limit: Int) async throws -> Paginated<StoreOrder>
    func getOrder(id: String) async throws -> StoreOrder
}
