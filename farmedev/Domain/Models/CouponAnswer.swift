//
//  CouponAnswer.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct CouponAnswer {
    let companyName: String
    let data: [Coupon]
    let familyCategory: [FamilyCategory]
    
    // Modelo auxiliar incluido directamente
    struct FamilyCategory {
        let code: Int
        let description: String
    }
}
