//
//  MergeGuestCartUseCase.swift
//  farmedev
//
//  Called once, right after a successful login/register (App/AppState.swift), while the
//  interceptor's stored token already reflects the now-authenticated session: reads every
//  local guest item, adds it to the server cart (summing quantities if the server cart
//  already had that product), then clears local storage.
//

import Foundation

final class MergeGuestCartUseCase {
    private let localStore: CartLocalDataStore
    private let cloudStore: CartRepository

    init(localStore: CartLocalDataStore = CartLocalDataStore(), cloudStore: CartRepository = CartCloudDataStore()) {
        self.localStore = localStore
        self.cloudStore = cloudStore
    }

    func execute() async {
        guard let items = try? localStore.allItems(), !items.isEmpty else { return }

        for item in items {
            let summary = CatalogProductSummary(
                id: item.productId, name: item.productName, imageUrl: item.imageUrl,
                price: item.unitPrice, stock: Int.max
            )
            _ = try? await cloudStore.addItem(product: summary, quantity: item.quantity)
        }

        try? localStore.deleteAll()
    }
}
