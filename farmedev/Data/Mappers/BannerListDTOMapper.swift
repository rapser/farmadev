//
//  BannerListDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension BannerListDTO {

    func toDomain() -> BannerList {
        BannerList(
            id: id ?? 0,
            title: title ?? "",
            image: image ?? "",
            action: action ?? ""
        )
    }
}
