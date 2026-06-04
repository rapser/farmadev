//
//  PaymentMethodResumeDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension PaymentMethodResumeDTO {

    func toDomain() -> PaymentMethodResume {
        PaymentMethodResume(
            id: id ?? 0,
            name: name ?? "",
            type: type ?? "",
            lastNumbers: lastNumbers ?? "",
            cardType: cardType ?? "",
            creditCardId: creditCardId ?? 0
        )
    }
}
