//
//  DashboardItemUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension DashboardItem {

    func toUI() -> DashboardItemUI {
        let content: DashboardItemUI.DashboardContentUI
        
        if let banner = banner {
            content = .banner(banner.toUI())
        } else if let list = list {
            content = .list(list.toUI())
        } else if let bannerList = bannerList {
            content = .bannerList(bannerList.toUI())
        } else if let sliderList = sliderList {
            content = .sliderList(sliderList.toUI())
        } else if let bannerKit = bannerKit {
            content = .bannerKit(bannerKit.toUI())
        } else if let wordList = wordList {
            content = .wordList(wordList)
        } else {
            content = .wordList("")
        }
        
        return DashboardItemUI(
            id: UUID().uuidString,
            type: type,
            backgroundColor: backgroundColor.isEmpty ? nil : backgroundColor,
            titleColor: titleColor.isEmpty ? nil : titleColor,
            content: content
        )
    }
}

extension DashboardItem.DashboardBanner {
    func toUI() -> DashboardItemUI.DashboardBannerUI {
        DashboardItemUI.DashboardBannerUI(
            id: UUID().uuidString,
            title: title,
            imageUrl: image,
            action: action
        )
    }
}

extension DashboardItem.DashboardList {
    func toUI() -> DashboardItemUI.DashboardListUI {
        DashboardItemUI.DashboardListUI(
            title: title,
            deepLink: deepLink,
            products: products.map { $0.toUI() }
        )
    }
}

extension DashboardItem.DashboardBannerList {
    func toUI() -> DashboardItemUI.DashboardBannerListUI {
        DashboardItemUI.DashboardBannerListUI(
            title: title,
            banners: items.map { $0.toUI() }
        )
    }
}
