//
//  CardConfiguration.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct CardConfiguration {
    let cardsAssociatedDefault: String?
    let cardsAssociated: [CardsAssociated]?
}

struct CardsAssociated {
    let id: String?
    let name: String?
    let valueTalon: String?
    let text: String?
    let image: String?
    let textSubTotal: String?
    let textTotal: String?
    let textSavedMoney: String?
}
