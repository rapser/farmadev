//
//  DiscountCanonicalUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DiscountCanonical {

    func toUI() -> DiscountCanonicalUI {
        DiscountCanonicalUI(
            id: id,
            code: code,
            name: name
        )
    }
}
