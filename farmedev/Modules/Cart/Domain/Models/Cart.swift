//
//  Cart.swift
//  farmedev
//

import Foundation

struct Cart: Equatable {
    let items: [CartItem]

    var subtotal: Double { items.reduce(0) { $0 + $1.lineTotal } }
    var itemCount: Int { items.reduce(0) { $0 + $1.quantity } }
    var isEmpty: Bool { items.isEmpty }

    static let empty = Cart(items: [])
}
