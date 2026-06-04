//
//  CartConfirmationDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CartConfirmationDTO {

    func toDomain() -> CartConfirmation {
        CartConfirmation(
            shoppingCartId: shoppingCartId ?? 0,
            idTransactionVisaNet: idTransactionVisaNet ?? "",
            purchaseNumber: purchaseNumber ?? "",
            transactionDateVisaNet: transactionDateVisaNet ?? "",
            numPanVisaNet: numPanVisaNet ?? "",
            authorizationCodeVisaNet: authorizationCodeVisaNet ?? "",
            amountPagoWeb: amountPagoWeb ?? 0,
            authorizationCode: authorizationCode ?? ""
        )
    }
}
