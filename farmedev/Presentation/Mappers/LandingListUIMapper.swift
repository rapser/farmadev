//
//  LandingListUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension LandingList {

    func toUI() -> LandingListUI {
        LandingListUI(
            title: title,
            deepLink: deepLink,
            products: products.map { $0.toUI() }
        )
    }
}
