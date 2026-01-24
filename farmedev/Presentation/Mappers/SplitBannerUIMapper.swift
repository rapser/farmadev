//
//  SplitBannerUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension SplitBanner {

    func toUI() -> SplitBannerUI {
        SplitBannerUI(
            title: title,
            items: items.map { $0.toUI() }
        )
    }
}
