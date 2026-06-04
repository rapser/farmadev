//
//  CouponsDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CouponsDTO {

    func toDomain() -> Coupons {
        Coupons(
            companyName: companyName ?? "",
            data: data?.map { $0.toDomain() } ?? [],
            familyCategory: familyCategory?.map { $0.toDomain() } ?? [],
            banners: banners?.map { $0.toDomain() } ?? [],
            error: error ?? ""
        )
    }
}

extension CouponsDTO.DataCouponDTO {
    func toDomain() -> Coupons.DataCoupon {
        Coupons.DataCoupon(
            id: id ?? "",
            sku: sku ?? "",
            skuMiFarma: skuMiFarma ?? "",
            discount: discount ?? "",
            discountType: discountType ?? "",
            isNominalDiscount: isNominalDiscount ?? false,
            discountToShow: discountToShow ?? "",
            discountCalculated: discountCalculated ?? "",
            couponValidity: couponValidity?.toDomain(),
            barCode: barCode ?? "",
            couponStatus: couponStatus ?? 0,
            termsAndConditions: termsAndConditions ?? "",
            savingValue: savingValue ?? "",
            priority: priority ?? 0,
            categoryCode: categoryCode ?? 0,
            pathImage: pathImage?.toDomain(),
            productDescription: productDescription ?? "",
            productName: productName ?? "",
            campaignId: campaignId ?? "",
            isFavourite: isFavourite ?? false,
            priorityByDiscountValue: priorityByDiscountValue ?? 0,
            isBicanal: isBicanal ?? false,
            urlEcommerce: urlEcommerce ?? "",
            isFlashCoupon: isFlashCoupon ?? false,
            isMultiHookCoupon: isMultiHookCoupon ?? false,
            familyCategoryCode: familyCategoryCode ?? 0,
            isContextCoupon: isContextCoupon ?? false
        )
    }
}

extension CouponsDTO.BannersDTO {
    func toDomain() -> Coupons.Banners {
        Coupons.Banners(
            id: id ?? 0,
            context: context ?? "",
            title: title ?? "",
            categoryTitle: categoryTitle ?? "",
            showBanner: showBanner ?? false
        )
    }
}
