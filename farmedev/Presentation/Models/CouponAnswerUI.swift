//
//  CouponAnswerUI.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct CouponAnswerUI {
    let companyName: String
    let coupons: [CouponUI]
    let categories: [FamilyCategoryUI]
    
    struct FamilyCategoryUI: Identifiable {
        let id: Int
        let description: String
    }
}
