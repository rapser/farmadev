//
//  ProductDashboardUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension ProductDashboard {

    func toUI() -> ProductDashboardUI {
        ProductDashboardUI(
            id: id,
            name: name,
            price: String(format: "%.2f", fractionalMode ? fractionalPrice : packPrice),
            imageUrl: pathImage,
            isFavorite: favorite,
            stock: fractionalMode ? "\(fractionalStock)" : "\(packStock)",
            shortDescription: shortDescription
        )
    }
}
