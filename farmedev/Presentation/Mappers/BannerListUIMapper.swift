//
//  BannerListUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension BannerList {

    func toUI() -> BannerListUI {
        BannerListUI(
            id: id,
            title: title,
            imageUrl: image,
            action: action
        )
    }
}
