//
//  DiscountCodeUserDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DiscountCodeUserDTO {
    func toDomain() -> DiscountCodeUser {
        DiscountCodeUser(
            couponCode: couponCode,
            urlImage: urlImage,
            urlLongTermCoditions: urlLongTermCoditions,
            endDate: endDate,
            smsMessage: smsMessage
        )
    }
}
