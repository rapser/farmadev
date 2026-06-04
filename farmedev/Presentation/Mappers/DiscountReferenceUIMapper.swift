//
//  DiscountReferenceUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension DiscountReference {

    func toUI() -> DiscountReferenceUI {
        DiscountReferenceUI(
            id: discountId,
            userName: userName,
            couponCode: couponCode,
            amountDiscount: String(format: "%.2f", amountDiscount),
            wasUsed: couponWasUsed
        )
    }
}
