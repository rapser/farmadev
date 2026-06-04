//
//  DiscountAmountUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension DiscountAmount {

    func toUI() -> DiscountAmountUI {
        DiscountAmountUI(
            originalAmount: String(format: "%.2f", originalAmount),
            discountAmount: String(format: "%.2f", discountAmount),
            discountName: discountCanonical?.name ?? ""
        )
    }
}
