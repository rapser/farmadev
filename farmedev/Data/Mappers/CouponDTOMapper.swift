//
//  CouponDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CouponDTO {

    func toDomain() -> Coupon {
        Coupon(
            id: id ?? "",
            sku: sku ?? "",
            skuMiFarma: skuMiFarma ?? "",
            discount: discount ?? "",
            discountType: discountType ?? "",
            isNominalDiscount: isNominalDiscount ?? false,
            campaignId: campaignId ?? "",
            discountToShow: discountToShow ?? "",
            termsAndConditions: termsAndConditions ?? "",
            barCode: barCode ?? "",
            couponStatus: couponStatus ?? 0,
            productDescription: productDescription ?? "",
            productName: productName ?? "",
            isBicanal: isBicanal ?? false,
            isFlashCoupon: isFlashCoupon ?? false,
            isContextCoupon: isContextCoupon ?? false,
            isMultiHookCoupon: isMultiHookCoupon ?? false,
            isWelcomeCoupon: isWelcomeCoupon ?? false,
            familyCategoryCode: familyCategoryCode ?? 0,
            savingValue: savingValue ?? "",
            isFavourite: isFavourite ?? false,
            urlEcommerce: urlEcommerce ?? "",
            couponValidity: couponValidity?.toDomain(),
            pathImage: pathImage?.toDomain()
        )
    }
}

extension CouponDTO.CouponValidityDTO {
    func toDomain() -> Coupon.CouponValidity {
        Coupon.CouponValidity(
            startDate: startDate ?? "",
            endDate: endDate ?? "",
            totalDays: totalDays ?? 0
        )
    }
}

extension CouponDTO.PathImageDTO {
    func toDomain() -> Coupon.PathImage {
        Coupon.PathImage(
            small: small ?? "",
            medium: medium ?? "",
            large: large ?? ""
        )
    }
}
