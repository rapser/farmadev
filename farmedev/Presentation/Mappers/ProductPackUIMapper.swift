//
//  ProductPackUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension ProductPack {

    func toUI() -> ProductPackUI {
        ProductPackUI(
            id: product?.id ?? lam?.id ?? UUID().uuidString,
            product: product?.toUI(),
            lam: lam?.toUI()
        )
    }
}
