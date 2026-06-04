//
//  ShoppingCartItemUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension ShoppingCartItem {

    func toUI() -> ShoppingCartItemUI {
        let product = self.product ?? lam
        return ShoppingCartItemUI(
            id: product?.id ?? UUID().uuidString,
            productName: product?.name ?? "",
            quantity: quantity,
            price: String(format: "%.2f", (product?.fractionalMode ?? false ? product?.fractionatedPrice ?? 0 : product?.price ?? 0) * Double(quantity)),
            imageUrl: product?.imageList.first?.url ?? ""
        )
    }
}
