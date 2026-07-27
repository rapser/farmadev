//
//  LocalCartItem.swift
//  farmedev
//
//  SwiftData-backed guest cart — a Data-layer implementation detail behind the same
//  CartRepository protocol the Cloud store implements. Domain never imports SwiftData;
//  only this file (and CartLocalDataStore) does. See PLAN.md section 2.8.2.
//

import Foundation
import SwiftData

@Model
final class LocalCartItem {
    var productId: String
    var productName: String
    var imageUrl: String
    var unitPrice: Double
    var quantity: Int

    init(productId: String, productName: String, imageUrl: String, unitPrice: Double, quantity: Int) {
        self.productId = productId
        self.productName = productName
        self.imageUrl = imageUrl
        self.unitPrice = unitPrice
        self.quantity = quantity
    }
}

enum LocalCartContainer {
    static let shared: ModelContainer = {
        // swiftlint:disable:next force_try
        try! ModelContainer(for: LocalCartItem.self)
    }()
}
