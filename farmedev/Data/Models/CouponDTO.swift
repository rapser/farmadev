//
//  CouponDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct CouponDTO: Codable {
    let id: String?
    let sku: String?
    let skuMiFarma: String?
    let discount: String?
    let discountType: String?
    let isNominalDiscount: Bool?
    let campaignId: String?
    let discountToShow: String?
    let termsAndConditions: String?
    let barCode: String?
    let couponStatus: Int?
    let productDescription: String?
    let productName: String?
    let isBicanal: Bool?
    let isFlashCoupon: Bool?
    let isContextCoupon: Bool?
    let isMultiHookCoupon: Bool?
    let isWelcomeCoupon: Bool?
    let familyCategoryCode: Int?
    let savingValue: String?
    let isFavourite: Bool?
    let urlEcommerce: String?
    let couponValidity: CouponValidityDTO?
    let pathImage: PathImageDTO?
    
    // Modelos auxiliares incluidos directamente
    struct CouponValidityDTO: Codable {
        let startDate: String?
        let endDate: String?
        let totalDays: Int?
    }
    
    struct PathImageDTO: Codable {
        let small: String?
        let medium: String?
        let large: String?
    }
}
