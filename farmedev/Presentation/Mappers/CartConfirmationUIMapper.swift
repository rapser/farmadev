//
//  CartConfirmationUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension CartConfirmation {

    func toUI() -> CartConfirmationUI {
        CartConfirmationUI(
            purchaseNumber: purchaseNumber,
            transactionDate: transactionDateVisaNet,
            amount: String(format: "%.2f", amountPagoWeb),
            authorizationCode: authorizationCode
        )
    }
}
