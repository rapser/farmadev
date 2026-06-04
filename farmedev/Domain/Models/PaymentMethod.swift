//
//  PaymentMethod.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct PaymentMethod {
    let id: Int
    let name: String
    let imageUrl: String
    let creditCardList: [CreditCard]
    let creditCardmodel: CreditCard?
    let favorite: Bool
    let provider: String
    let cardName: String
    let type: String
    let paidAmount: Double
    let changeAmount: Double
    
    // Modelo auxiliar incluido directamente
    struct CreditCard {
        let id: Int
        let name: String
        let imageUrl: String
        let favorite: Bool
        let descriptionShort: String
        let descriptionLarge: String
        let colorDescription: String
        let cardGroup: String
        let paymentMethodPagoWeb: String
    }
}
