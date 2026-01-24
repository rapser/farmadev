//
//  BannerKitUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension BannerKit {

    func toUI() -> BannerKitUI {
        BannerKitUI(
            title: title,
            bagOfProducts: bagOfProducts,
            bagOfGift: bagOfGift,
            banner: banner?.toUI()
        )
    }
}
