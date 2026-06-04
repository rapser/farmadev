//
//  DashboardItemUI.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct DashboardItemUI: Identifiable {
    let id: String
    let type: String
    let backgroundColor: String?
    let titleColor: String?
    let content: DashboardContentUI
    
    enum DashboardContentUI {
        case banner(DashboardBannerUI)
        case list(DashboardListUI)
        case bannerList(DashboardBannerListUI)
        case sliderList(SliderBannerUI)
        case bannerKit(BannerKitUI)
        case wordList(String)
    }
    
    struct DashboardBannerUI: Identifiable {
        let id: String
        let title: String
        let imageUrl: String
        let action: String
    }
    
    struct DashboardListUI {
        let title: String
        let deepLink: String
        let products: [ProductPackUI]
    }
    
    struct DashboardBannerListUI {
        let title: String
        let banners: [DashboardBannerUI]
    }
}
