//
//  SliderBannerDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension SliderBannerDTO {

    func toDomain() -> SliderBanner {
        SliderBanner(
            title: title ?? "",
            data: data?.map { $0.toDomain() } ?? []
        )
    }
}
