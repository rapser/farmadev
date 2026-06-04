//
//  AntifraudInfoDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct AntifraudInfoDTO: Codable {
    let shoppingCartId: Int?
    let userId: String?
    let phoneNumber: String?
    let email: String?
    let isAnonymous: String?
    let amount: Double?
    let identityDocumentNumber: String?
    let drugstore: String?
    let dateCreated: String?
    let district: String?
    let ubigeo: String?
    let address: String?
    let name: String?
    let lastname: String?
    let city: String?
}
