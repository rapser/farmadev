//
//  PaymentMethodResumeUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension PaymentMethodResume {

    func toUI() -> PaymentMethodResumeUI {
        PaymentMethodResumeUI(
            name: name,
            type: type,
            lastNumbers: lastNumbers,
            cardType: cardType
        )
    }
}
