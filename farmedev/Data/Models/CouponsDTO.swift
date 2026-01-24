//
//  CouponsDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct CouponsDTO: Codable {
    let companyName: String?
    let data: [DataCouponDTO]?
    let familyCategory: [CouponAnswerDTO.FamilyCategoryDTO]?
    let banners: [BannersDTO]?
    let error: String?
    
    // Modelos auxiliares incluidos directamente
    struct DataCouponDTO: Codable {
        let id: String?
        let sku: String?
        let skuMiFarma: String?
        let discount: String?
        let discountType: String?
        let isNominalDiscount: Bool?
        let discountToShow: String?
        let discountCalculated: String?
        let couponValidity: CouponDTO.CouponValidityDTO?
        let barCode: String?
        let couponStatus: Int?
        let termsAndConditions: String?
        let savingValue: String?
        let priority: Int?
        let categoryCode: Int?
        let pathImage: CouponDTO.PathImageDTO?
        let productDescription: String?
        let productName: String?
        let campaignId: String?
        let isFavourite: Bool?
        let priorityByDiscountValue: Int?
        let isBicanal: Bool?
        let urlEcommerce: String?
        let isFlashCoupon: Bool?
        let isMultiHookCoupon: Bool?
        let familyCategoryCode: Int?
        let isContextCoupon: Bool?
    }
    
    struct BannersDTO: Codable {
        let id: Int?
        let context: String?
        let title: String?
        let categoryTitle: String?
        let showBanner: Bool?
    }
}
