//
//  CouponsUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension Coupons {

    func toUI() -> CouponsUI {
        CouponsUI(
            companyName: companyName,
            coupons: data.map { coupon in
                Coupon(
                    id: coupon.id,
                    sku: coupon.sku,
                    skuMiFarma: coupon.skuMiFarma,
                    discount: coupon.discount,
                    discountType: coupon.discountType,
                    isNominalDiscount: coupon.isNominalDiscount,
                    campaignId: coupon.campaignId,
                    discountToShow: coupon.discountToShow,
                    termsAndConditions: coupon.termsAndConditions,
                    barCode: coupon.barCode,
                    couponStatus: coupon.couponStatus,
                    productDescription: coupon.productDescription,
                    productName: coupon.productName,
                    isBicanal: coupon.isBicanal,
                    isFlashCoupon: coupon.isFlashCoupon,
                    isContextCoupon: coupon.isContextCoupon,
                    isMultiHookCoupon: coupon.isMultiHookCoupon,
                    isWelcomeCoupon: false,
                    familyCategoryCode: coupon.familyCategoryCode,
                    savingValue: coupon.savingValue,
                    isFavourite: coupon.isFavourite,
                    urlEcommerce: coupon.urlEcommerce,
                    couponValidity: coupon.couponValidity,
                    pathImage: coupon.pathImage
                ).toUI()
            },
            categories: familyCategory.map { $0.toUI() },
            banners: banners.map { $0.toUI() }
        )
    }
}

extension Coupons.Banners {
    func toUI() -> CouponsUI.BannersUI {
        CouponsUI.BannersUI(
            id: id,
            title: title,
            categoryTitle: categoryTitle,
            showBanner: showBanner
        )
    }
}
