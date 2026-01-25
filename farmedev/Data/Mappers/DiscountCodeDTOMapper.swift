//
//  DiscountCodeDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DiscountCodeDTO {
    func toDomain() -> DiscountCode {
        DiscountCode(
            valid: valid,
            message: message
        )
    }
}
