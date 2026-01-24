//
//  Coupons.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct Coupons {
    let companyName: String
    let data: [DataCoupon]
    let familyCategory: [CouponAnswer.FamilyCategory]
    let banners: [Banners]
    let error: String
    
    // Modelos auxiliares incluidos directamente
    struct DataCoupon {
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
        let pathImage: Coupon.PathImage?
        let productDescription: String
        let productName: String
        let campaignId: String
        let isFavourite: Bool
        let priorityByDiscountValue: Int
        let isBicanal: Bool
        let urlEcommerce: String
        let isFlashCoupon: Bool
        let isMultiHookCoupon: Bool
        let familyCategoryCode: Int
        let isContextCoupon: Bool
    }
    
    struct Banners {
        let id: Int
        let context: String
        let title: String
        let categoryTitle: String
        let showBanner: Bool
    }
}
