//
//  UserLoginDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension UserLoginDTO {

    func toDomain() -> UserLogin {
        UserLogin(
            phone: phone ?? "",
            email: email ?? "",
            name: name ?? "",
            isAnonymous: isAnonymous ?? false,
            companyId: companyId ?? 0,
            authId: authId ?? "",
            id: id ?? 0,
            uids: uids ?? "",
            authUserId: authUserId ?? 0,
            encryptedDni: encryptedDni ?? "",
            encryptedEmail: encryptedEmail ?? "",
            intercorp: intercorp ?? false,
            anonymous: anonymous ?? false,
            identityDocumentType: identityDocumentType ?? 0,
            identityDocumentNumber: identityDocumentNumber ?? "",
            paternalLastName: paternalLastName ?? "",
            maternalLastName: maternalLastName ?? "",
            birthDate: birthDate ?? "",
            sexId: sexId ?? 0,
            photoUrl: photoUrl ?? "",
            termsAndConditions: termsAndConditions ?? false,
            privacyPolicy: privacyPolicy ?? false,
            dataTreatment: dataTreatment ?? false
        )
    }
}
