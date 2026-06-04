//
//  PaymentMethodResumeDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct PaymentMethodResumeDTO: Codable {
    let id: Int?
    let name: String?
    let type: String?
    let lastNumbers: String?
    let cardType: String?
    let creditCardId: Int?
}
