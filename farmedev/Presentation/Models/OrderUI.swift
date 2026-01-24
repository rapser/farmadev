//
//  OrderUI.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct OrderUI: Identifiable {
    let id: Int
    let orderNumber: String
    let status: String
    let totalCost: String
    let deliveryDate: String
    let address: String
    let productsCount: Int
}
