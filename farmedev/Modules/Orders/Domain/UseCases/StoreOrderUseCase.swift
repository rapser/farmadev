//
//  StoreOrderUseCase.swift
//  farmedev
//

import Foundation

final class StoreOrderUseCase {
    private let repository: StoreOrderRepository

    init(repository: StoreOrderRepository = StoreOrderDataRepository()) {
        self.repository = repository
    }

    func createOrder(addressLine: String, district: String, reference: String?, paymentMethod: String) async throws -> StoreOrder {
        try await repository.createOrder(addressLine: addressLine, district: district, reference: reference, paymentMethod: paymentMethod)
    }

    func getOrders(page: Int = 1, limit: Int = 20) async throws -> Paginated<StoreOrder> {
        try await repository.getOrders(page: page, limit: limit)
    }

    func getOrder(id: String) async throws -> StoreOrder {
        try await repository.getOrder(id: id)
    }
}
