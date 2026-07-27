//
//  OrderDetailLoaderView.swift
//  farmedev
//
//  Thin id -> StoreOrder loader so navigation routes can carry just a Hashable id
//  instead of the full StoreOrder value.
//

import SwiftUI

struct OrderDetailLoaderView: View {
    let orderId: String
    @State private var order: StoreOrder?
    private let useCase = StoreOrderUseCase()

    var body: some View {
        Group {
            if let order {
                OrderDetailView(order: order)
            } else {
                ProgressView().task { order = try? await useCase.getOrder(id: orderId) }
            }
        }
    }
}
