//
//  DiscountCodeUserDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct DiscountCodeUserDTO: Codable {
    let couponCode: String?
    let urlImage: String?
    let urlLongTermCoditions: String?
    let endDate: String?
    let smsMessage: String?
}
