//
//  ShowcaseUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension Showcase {

    func toUI() -> ShowcaseUI {
        ShowcaseUI(
            title: title,
            section: section,
            banners: template?.banners.map { $0.toUI() } ?? []
        )
    }
}

extension Showcase.ShowcaseBanner {
    func toUI() -> ShowcaseUI.ShowcaseBannerUI {
        ShowcaseUI.ShowcaseBannerUI(
            id: UUID().uuidString,
            imageUrl: urlImage,
            link: link
        )
    }
}
