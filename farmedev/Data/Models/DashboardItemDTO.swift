//
//  DashboardItemDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct DashboardItemDTO: Codable {
    let type: String?
    let backgroundColor: String?
    let titleColor: String?
    let banner: DashboardBannerDTO?
    let list: DashboardListDTO?
    let bannerList: DashboardBannerListDTO?
    let sliderList: SliderBannerDTO?
    let bannerKit: BannerKitDTO?
    let wordList: String?
    
    // Modelos auxiliares incluidos directamente
    struct DashboardBannerDTO: Codable {
        let title: String?
        let image: String?
        let action: String?
        let template: String?
        let _description: String?
        let limitOfferTime: String?
    }
    
    struct DashboardListDTO: Codable {
        let title: String?
        let deepLink: String?
        let name: String?
        let productForSaleList: [ProductDashboardDTO]?
        let products: [ProductPackDTO]?
        let itemsPerView: Int?
    }
    
    struct DashboardBannerListDTO: Codable {
        let title: String?
        let items: [DashboardBannerDTO]?
    }
}
