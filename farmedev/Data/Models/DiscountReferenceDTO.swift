//
//  DiscountReferenceDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct DiscountReferenceDTO: Codable {
    let discountByReferenceId: Int?
    let discountId: Int?
    let userName: String?
    let couponWasUsed: Bool?
    let amountDiscount: Float?
    let couponId: Int?
    let type: String?
    let sequential: String?
    let couponCode: String?
}
