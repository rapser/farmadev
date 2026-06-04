//
//  PaymentMethodDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct PaymentMethodDTO: Codable {
    let id: Int?
    let name: String?
    let imageUrl: String?
    let creditCardList: [CreditCardDTO]?
    let creditCardmodel: CreditCardDTO?
    let favorite: Bool?
    let provider: String?
    let cardName: String?
    let type: String?
    let paidAmount: Double?
    let changeAmount: Double?
    
    // Modelo auxiliar incluido directamente
    struct CreditCardDTO: Codable {
        let id: Int?
        let name: String?
        let imageUrl: String?
        let favorite: Bool?
        let descriptionShort: String?
        let descriptionLarge: String?
        let colorDescription: String?
        let cardGroup: String?
        let paymentMethodPagoWeb: String?
    }
}
