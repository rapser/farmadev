//
//  OrderUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension Order {

    func toUI() -> OrderUI {
        OrderUI(
            id: shoppingCartId,
            orderNumber: "\(shoppingCartId)",
            status: shoppingCartStatus,
            totalCost: String(format: "%.2f", totalCost),
            deliveryDate: deliveryDate > 0 ? String(deliveryDate) : "",
            address: address?.address ?? pickupAddress,
            productsCount: productList.count
        )
    }
}
