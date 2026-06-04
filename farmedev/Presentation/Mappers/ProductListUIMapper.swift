//
//  ProductListUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension ProductList {

    func toUI() -> ProductListUI {
        ProductListUI(
            id: id,
            name: name,
            brand: brand,
            price: String(format: "%.2f", fractionalMode ? fractionatedPrice : price),
            imageUrl: imageList.first?.url ?? "",
            isFavorite: favorite,
            stock: stock > 0 ? "\(stock)" : "Sin stock",
            shortDescription: shortDescription
        )
    }
}
