//
//  ShoppingCartDiscountDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ShoppingCartDiscountDTO {

    func toDomain() -> ShoppingCartDiscount {
        ShoppingCartDiscount(
            subtotal: subtotal ?? 0,
            total: total ?? 0,
            decimalTotal: decimalTotal ?? 0,
            discount: discount ?? 0,
            discountId: discountId ?? 0,
            deliveryCost: deliveryCost ?? 0,
            discountedAmountCanonical: discountedAmountCanonical?.toDomain(),
            totalNoRounding: totalNoRounding ?? 0,
            productsTotalRounding: productsTotalRounding ?? 0,
            ahorro: ahorro ?? 0,
            totalOnline: totalOnline ?? 0
        )
    }
}
