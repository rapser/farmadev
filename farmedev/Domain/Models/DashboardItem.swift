//
//  DashboardItem.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct DashboardItem {
    let type: String
    let backgroundColor: String
    let titleColor: String
    let banner: DashboardBanner?
    let list: DashboardList?
    let bannerList: DashboardBannerList?
    let sliderList: SliderBanner?
    let bannerKit: BannerKit?
    let wordList: String?
    
    // Modelos auxiliares incluidos directamente
    struct DashboardBanner {
        let title: String
        let image: String
        let action: String
        let template: String
        let _description: String
        let limitOfferTime: String
    }
    
    struct DashboardList {
        let title: String
        let deepLink: String
        let name: String
        let productForSaleList: [ProductDashboard]
        let products: [ProductPack]
        let itemsPerView: Int
    }
    
    struct DashboardBannerList {
        let title: String
        let items: [DashboardBanner]
    }
}
