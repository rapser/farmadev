//
//  DiscountReferedUserDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct DiscountReferedUserDTO: Codable {
    let discountId: Int?
    let totalAvailable: Double?
    let discounts: [DiscountReferenceDTO]?
}
