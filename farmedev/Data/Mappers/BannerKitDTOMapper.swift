//
//  BannerKitDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension BannerKitDTO {

    func toDomain() -> BannerKit {
        BannerKit(
            title: title ?? "",
            bagOfProducts: bagOfProducts ?? "",
            bagOfGift: bagOfGift ?? "",
            idCampaign: idCampaign ?? "",
            banner: banner?.toDomain()
        )
    }
}
