//
//  UserPickUpDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct UserPickUpDTO: Codable {
    let id: Int?
    let fullName: String?
    let email: String?
    let identityDocumenType: Int?
    let identityDocumentNumber: String?
    let phone: String?
    let favorite: Bool?
}
