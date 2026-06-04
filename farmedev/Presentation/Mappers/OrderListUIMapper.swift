//
//  OrderListUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension OrderList {

    func toUI() -> OrderListUI {
        OrderListUI(
            orders: orders.map { $0.toUI() }
        )
    }
}
