//
//  SplitBannerDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension SplitBannerDTO {

    func toDomain() -> SplitBanner {
        SplitBanner(
            title: title ?? "",
            items: items?.map { $0.toDomain() } ?? []
        )
    }
}
