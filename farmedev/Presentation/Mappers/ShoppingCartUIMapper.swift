//
//  ShoppingCartUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension ShoppingCart {

    func toUI() -> ShoppingCartUI {
        ShoppingCartUI(
            id: id,
            total: String(format: "%.2f", precalculation?.total ?? 0),
            subtotal: String(format: "%.2f", precalculation?.subtotal ?? 0),
            discount: String(format: "%.2f", precalculation?.discount ?? 0),
            deliveryCost: String(format: "%.2f", precalculation?.deliveryCost ?? 0),
            productsCount: productItemList.count,
            deliveryTime: deliveryTime > 0 ? "\(deliveryTime) min" : "",
            address: address?.address ?? ""
        )
    }
}
