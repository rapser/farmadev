//
//  StoreProductUI.swift
//  farmedev
//

import Foundation

struct StoreProductUI: Identifiable, Equatable {
    let id: String
    let name: String
    let description: String
    let imageUrl: String
    let priceLabel: String
    let priceValue: Double
    let stock: Int
    let categoryId: String?
    let requiresPrescription: Bool
    let isFeatured: Bool

    var isInStock: Bool { stock > 0 }

    var summary: CatalogProductSummary {
        CatalogProductSummary(id: id, name: name, imageUrl: imageUrl, price: priceValue, stock: stock)
    }
}

struct StoreCategoryUI: Identifiable, Equatable {
    let id: String
    let name: String
    let iconUrl: String?
}

struct StoreBannerUI: Identifiable, Equatable {
    let id: String
    let imageUrl: String
    let title: String?
    let actionType: String
    let actionValue: String?
}

extension StoreProduct {
    func toUI() -> StoreProductUI {
        StoreProductUI(
            id: id,
            name: name,
            description: description,
            imageUrl: imageUrl,
            priceLabel: CurrencyFormatting.soles(price),
            priceValue: price,
            stock: stock,
            categoryId: categoryId,
            requiresPrescription: requiresPrescription,
            isFeatured: isFeatured
        )
    }
}

extension StoreCategory {
    func toUI() -> StoreCategoryUI {
        StoreCategoryUI(id: id, name: name, iconUrl: iconUrl)
    }
}

extension StoreBanner {
    func toUI() -> StoreBannerUI {
        StoreBannerUI(id: id, imageUrl: imageUrl, title: title, actionType: actionType, actionValue: actionValue)
    }
}
