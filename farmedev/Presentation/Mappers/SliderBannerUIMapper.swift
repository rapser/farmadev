//
//  SliderBannerUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension SliderBanner {

    func toUI() -> SliderBannerUI {
        SliderBannerUI(
            title: title,
            banners: data.map { $0.toUI() }
        )
    }
}
