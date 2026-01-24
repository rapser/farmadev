//
//  DiscountAmountDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DiscountAmountDTO {

    func toDomain() -> DiscountAmount {
        DiscountAmount(
            originalAmount: originalAmount ?? 0,
            discountAmount: discountAmount ?? 0,
            discountCanonical: discountCanonical?.toDomain()
        )
    }
}
