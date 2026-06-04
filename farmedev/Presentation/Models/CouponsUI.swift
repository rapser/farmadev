//
//  CouponsUI.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct CouponsUI {
    let companyName: String
    let coupons: [CouponUI]
    let categories: [CouponAnswerUI.FamilyCategoryUI]
    let banners: [BannersUI]
    
    struct BannersUI: Identifiable {
        let id: Int
        let title: String
        let categoryTitle: String
        let showBanner: Bool
    }
}
