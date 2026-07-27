//
//  CartDTOMapper.swift
//  farmedev
//

import Foundation

extension CartDTO {
    func toDomain() -> Cart {
        Cart(items: items.map { item in
            CartItem(
                productId: item.productId,
                productName: item.product?.name ?? "Producto",
                imageUrl: item.product?.imageUrl ?? "",
                unitPrice: Double(item.unitPriceSnapshot) ?? 0,
                quantity: item.quantity
            )
        })
    }
}
