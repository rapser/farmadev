//
//  CartConfirmationDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct CartConfirmationDTO: Codable {
    let shoppingCartId: Int?
    let idTransactionVisaNet: String?
    let purchaseNumber: String?
    let transactionDateVisaNet: String?
    let numPanVisaNet: String?
    let authorizationCodeVisaNet: String?
    let amountPagoWeb: Double?
    let authorizationCode: String?
}
