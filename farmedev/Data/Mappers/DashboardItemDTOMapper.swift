//
//  DashboardItemDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DashboardItemDTO {

    func toDomain() -> DashboardItem {
        DashboardItem(
            type: type ?? "",
            backgroundColor: backgroundColor ?? "",
            titleColor: titleColor ?? "",
            banner: banner?.toDomain(),
            list: list?.toDomain(),
            bannerList: bannerList?.toDomain(),
            sliderList: sliderList?.toDomain(),
            bannerKit: bannerKit?.toDomain(),
            wordList: wordList
        )
    }
}

extension DashboardItemDTO.DashboardBannerDTO {
    func toDomain() -> DashboardItem.DashboardBanner {
        DashboardItem.DashboardBanner(
            title: title ?? "",
            image: image ?? "",
            action: action ?? "",
            template: template ?? "",
            _description: _description ?? "",
            limitOfferTime: limitOfferTime ?? ""
        )
    }
}

extension DashboardItemDTO.DashboardListDTO {
    func toDomain() -> DashboardItem.DashboardList {
        DashboardItem.DashboardList(
            title: title ?? "",
            deepLink: deepLink ?? "",
            name: name ?? "",
            productForSaleList: productForSaleList?.map { $0.toDomain() } ?? [],
            products: products?.map { $0.toDomain() } ?? [],
            itemsPerView: itemsPerView ?? 0
        )
    }
}

extension DashboardItemDTO.DashboardBannerListDTO {
    func toDomain() -> DashboardItem.DashboardBannerList {
        DashboardItem.DashboardBannerList(
            title: title ?? "",
            items: items?.map { $0.toDomain() } ?? []
        )
    }
}
