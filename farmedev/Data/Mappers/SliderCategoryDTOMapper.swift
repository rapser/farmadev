//
//  SliderCategoryDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension SliderCategoryDTO {

    func toDomain() -> SliderCategory {
        SliderCategory(
            iconTitle: iconTitle ?? "",
            iconUrl: iconUrl ?? "",
            deepLink: deepLink ?? "",
            titleColor: titleColor ?? ""
        )
    }
}
