//
//  OrderHistoryViewModel.swift
//  farmedev
//

import Foundation

@Observable
final class OrderHistoryViewModel {
    var orders: [StoreOrder] = []
    var isLoading = false

    private let useCase: StoreOrderUseCase

    init(useCase: StoreOrderUseCase = StoreOrderUseCase()) {
        self.useCase = useCase
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }
        orders = (try? await useCase.getOrders())?.items ?? []
    }
}
