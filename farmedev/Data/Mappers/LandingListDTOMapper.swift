//
//  LandingListDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension LandingListDTO {

    func toDomain() -> LandingList {
        LandingList(
            title: title ?? "",
            deepLink: deepLink ?? "",
            itemsPerView: itemsPerView ?? 0,
            products: products?.map { $0.toDomain() } ?? []
        )
    }
}
