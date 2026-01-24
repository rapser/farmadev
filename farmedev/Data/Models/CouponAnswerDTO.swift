//
//  CouponAnswerDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct CouponAnswerDTO: Codable {
    let companyName: String?
    let data: [CouponDTO]?
    let familyCategory: [FamilyCategoryDTO]?
    
    // Modelo auxiliar incluido directamente
    struct FamilyCategoryDTO: Codable {
        let code: Int?
        let description: String?
    }
}
