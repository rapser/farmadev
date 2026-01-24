//
//  Coupon.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct Coupon {
    let id: String
    let sku: String
    let skuMiFarma: String
    let discount: String
    let discountType: String
    let isNominalDiscount: Bool
    let campaignId: String
    let discountToShow: String
    let termsAndConditions: String
    let barCode: String
    let couponStatus: Int
    let productDescription: String
    let productName: String
    let isBicanal: Bool
    let isFlashCoupon: Bool
    let isContextCoupon: Bool
    let isMultiHookCoupon: Bool
    let isWelcomeCoupon: Bool
    let familyCategoryCode: Int
    let savingValue: String
    let isFavourite: Bool
    let urlEcommerce: String
    let couponValidity: CouponValidity?
    let pathImage: PathImage?
    
    // Modelos auxiliares incluidos directamente
    struct CouponValidity {
        let startDate: String
        let endDate: String
        let totalDays: Int
    }
    
    struct PathImage {
        let small: String
        let medium: String
        let large: String
    }
}
