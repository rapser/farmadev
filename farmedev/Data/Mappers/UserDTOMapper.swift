//
//  UserDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension UserDTO {

    func toDomain() -> User {
        User(
            dni: dni ?? "",
            phone: phone ?? "",
            email: email ?? "",
            name: name ?? "",
            lastName: lastName ?? "",
            birthDate: birthDate ?? 0,
            photo: photo ?? "",
            photoExtension: photoExtension ?? "",
            photoUrl: photoUrl ?? "",
            sexId: sexId ?? 0,
            flagAuditTerms: flagAuditTerms ?? false,
            flagTermsAndConditions: flagTermsAndConditions ?? false,
            flagPrivacyPolicy: flagPrivacyPolicy ?? false,
            flagDataTreatment: flagDataTreatment ?? false,
            encryptedDni: encryptedDni ?? "",
            encryptedEmail: encryptedEmail ?? ""
        )
    }
}
