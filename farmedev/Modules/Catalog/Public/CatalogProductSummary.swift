//
//  CatalogProductSummary.swift
//  farmedev
//
//  Lightweight surface other modules (Cart, Checkout, Account/Favorites) consume instead
//  of importing Modules/Catalog/Domain directly.
//

import Foundation

struct CatalogProductSummary: Identifiable, Equatable {
    let id: String
    let name: String
    let imageUrl: String
    let price: Double
    let stock: Int
}

extension StoreProduct {
    var summary: CatalogProductSummary {
        CatalogProductSummary(id: id, name: name, imageUrl: imageUrl, price: price, stock: stock)
    }
}
