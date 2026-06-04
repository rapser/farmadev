//
//  ContentConfigDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct ContentConfigDTO: Codable {
    let defaultZoomForMap: Int?
    let messageForDirectSearch: String?
    let thereIsNoStoreWithStock: String?
    let delayForPredictiveAddresses: Int?
    let messageForRequiredGeolocation: String?
    let suggestedMessageForPredictiveAddresses: String?
    let minimunCharactersForPredictiveAddresses: Int?
    let tagRet: String?
}
