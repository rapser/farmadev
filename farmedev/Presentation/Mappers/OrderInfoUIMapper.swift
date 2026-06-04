//
//  OrderInfoUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension OrderInfo {

    func toUI() -> OrderInfoUI {
        OrderInfoUI(
            orderNumber: shoppingCartId,
            status: shoppingCartStatus,
            totalCost: String(format: "%.2f", totalCost),
            deliveryType: deliveryTypeDescription,
            deliveryDate: orderDateConfirm,
            address: address?.name ?? pickupAddress
        )
    }
}
