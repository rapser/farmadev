//
//  CouponDetailUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CouponDetail {

    func toUI() -> CouponDetailUI {
        CouponDetailUI(
            coupon: data != nil ? Coupon(
                id: data!.id,
                sku: data!.sku,
                skuMiFarma: data!.skuMiFarma,
                discount: data!.discount,
                discountType: data!.discountType,
                isNominalDiscount: data!.isNominalDiscount,
                campaignId: data!.campaignId,
                discountToShow: data!.discountToShow,
                termsAndConditions: data!.termsAndConditions,
                barCode: data!.barCode,
                couponStatus: data!.couponStatus,
                productDescription: data!.productDescription,
                productName: data!.productName,
                isBicanal: data!.isBicanal,
                isFlashCoupon: data!.isFlashCoupon,
                isContextCoupon: data!.isContextCoupon,
                isMultiHookCoupon: data!.isMultiHookCoupon,
                isWelcomeCoupon: false,
                familyCategoryCode: data!.familyCategoryCode,
                savingValue: data!.savingValue,
                isFavourite: data!.isFavourite,
                urlEcommerce: data!.urlEcommerce,
                couponValidity: data!.couponValidity != nil ? Coupon.CouponValidity(
                    startDate: data!.couponValidity!.startDate,
                    endDate: data!.couponValidity!.endDate,
                    totalDays: data!.couponValidity!.totalDays
                ) : nil,
                pathImage: data!.pathImage != nil ? Coupon.PathImage(
                    small: data!.pathImage!.small,
                    medium: data!.pathImage!.medium,
                    large: data!.pathImage!.large
                ) : nil
            ).toUI() : CouponUI(id: "", title: "", discount: "", imageUrl: "", isFavorite: false, validity: ""),
            error: error.isEmpty ? nil : error
        )
    }
}
