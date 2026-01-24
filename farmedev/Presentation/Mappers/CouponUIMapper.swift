//
//  CouponUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension Coupon {

    func toUI() -> CouponUI {
        CouponUI(
            id: id,
            title: productName,
            discount: discountToShow,
            imageUrl: pathImage?.medium ?? "",
            isFavorite: isFavourite,
            validity: couponValidity != nil ? "\(couponValidity!.startDate) - \(couponValidity!.endDate)" : ""
        )
    }
}
