//
//  UserLoginDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct UserLoginDTO: Codable {
    let phone: String?
    let email: String?
    let name: String?
    let isAnonymous: Bool?
    let companyId: Int?
    let authId: String?
    let id: Int?
    let uids: String?
    let authUserId: Int?
    let encryptedDni: String?
    let encryptedEmail: String?
    let intercorp: Bool?
    let anonymous: Bool?
    let identityDocumentType: Int?
    let identityDocumentNumber: String?
    let paternalLastName: String?
    let maternalLastName: String?
    let birthDate: String?
    let sexId: Int?
    let photoUrl: String?
    let termsAndConditions: Bool?
    let privacyPolicy: Bool?
    let dataTreatment: Bool?
}
