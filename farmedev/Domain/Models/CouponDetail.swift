//
//  CouponDetail.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct CouponDetail {
    let companyName: String
    let data: DataDetailCoup?
    let error: String
    
    // Modelos auxiliares incluidos directamente
    struct DataDetailCoup {
        let id: String
        let sku: String
        let skuMiFarma: String
        let discount: String
        let discountType: String
        let isNominalDiscount: Bool
        let discountToShow: String
        let discountCalculated: String
        let couponValidity: Coupon.CouponValidity?
        let barCode: String
        let couponStatus: Int
        let termsAndConditions: String
        let savingValue: String
        let priority: Int
        let categoryCode: Int
        let categoryRelation: [CategoryRelation]
        let pathImage: PathImageDetail?
        let productDescription: String
        let productName: String
        let campaignId: String
        let isFavourite: Bool
        let priorityByDiscountValue: Int
        let isBicanal: Bool
        let isFlashCoupon: Bool
        let isMultiHookCoupon: Bool
        let familyCategoryCode: Int
        let isContextCoupon: Bool
        let isPackagePromotion: Bool
        let urlEcommerce: String
    }
    
    struct CategoryRelation {
        let categoryCode: Int
        let priority: Int
    }
    
    struct PathImageDetail {
        let small: String
        let medium: String
        let large: String
    }
}
