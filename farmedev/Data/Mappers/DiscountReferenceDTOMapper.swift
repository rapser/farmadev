//
//  DiscountReferenceDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DiscountReferenceDTO {

    func toDomain() -> DiscountReference {
        DiscountReference(
            discountByReferenceId: discountByReferenceId ?? 0,
            discountId: discountId ?? 0,
            userName: userName ?? "",
            couponWasUsed: couponWasUsed ?? false,
            amountDiscount: amountDiscount ?? 0,
            couponId: couponId ?? 0,
            type: type ?? "",
            sequential: sequential ?? "",
            couponCode: couponCode ?? ""
        )
    }
}
