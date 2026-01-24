//
//  CouponDetailDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CouponDetailDTO {

    func toDomain() -> CouponDetail {
        CouponDetail(
            companyName: companyName ?? "",
            data: data?.toDomain(),
            error: error ?? ""
        )
    }
}

extension CouponDetailDTO.DataDetailCoupDTO {
    func toDomain() -> CouponDetail.DataDetailCoup {
        CouponDetail.DataDetailCoup(
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
            categoryRelation: categoryRelation?.map { $0.toDomain() } ?? [],
            pathImage: pathImage?.toDomain(),
            productDescription: productDescription ?? "",
            productName: productName ?? "",
            campaignId: campaignId ?? "",
            isFavourite: isFavourite ?? false,
            priorityByDiscountValue: priorityByDiscountValue ?? 0,
            isBicanal: isBicanal ?? false,
            isFlashCoupon: isFlashCoupon ?? false,
            isMultiHookCoupon: isMultiHookCoupon ?? false,
            familyCategoryCode: familyCategoryCode ?? 0,
            isContextCoupon: isContextCoupon ?? false,
            isPackagePromotion: isPackagePromotion ?? false,
            urlEcommerce: urlEcommerce ?? ""
        )
    }
}

extension CouponDetailDTO.CategoryRelationDTO {
    func toDomain() -> CouponDetail.CategoryRelation {
        CouponDetail.CategoryRelation(
            categoryCode: categoryCode ?? 0,
            priority: priority ?? 0
        )
    }
}

extension CouponDetailDTO.PathImageDetailDTO {
    func toDomain() -> CouponDetail.PathImageDetail {
        CouponDetail.PathImageDetail(
            small: small ?? "",
            medium: medium ?? "",
            large: large ?? ""
        )
    }
}
