//
//  DiscountUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension Discount {

    func toUI() -> DiscountUI {
        DiscountUI(
            id: id,
            name: name,
            type: type,
            isEnabled: isEnable.lowercased() == "true" || isEnable == "1"
        )
    }
}
