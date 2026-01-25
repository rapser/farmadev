//
//  DiscountReferedUserDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DiscountReferedUserDTO {
    func toDomain() -> DiscountReferedUser {
        DiscountReferedUser(
            discountId: discountId,
            totalAvailable: totalAvailable,
            discounts: discounts?.map { $0.toDomain() } ?? []
        )
    }
}
