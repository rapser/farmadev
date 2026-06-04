//
//  UpdateUserResponseDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension UpdateUserResponseDTO {
    func toDomain() -> UpdateUserResponse {
        UpdateUserResponse(
            phone: phone,
            email: email,
            name: name,
            isAnonymous: isAnonymous,
            companyId: companyId,
            authId: authId,
            id: id,
            uids: uids,
            authUserId: authUserId,
            encryptedDni: encryptedDni,
            encryptedEmail: encryptedEmail,
            intercorp: intercorp,
            anonymous: anonymous,
            identityDocumentType: identityDocumentType,
            identityDocumentNumber: identityDocumentNumber,
            paternalLastName: paternalLastName,
            maternalLastName: maternalLastName,
            birthDate: birthDate,
            sexId: sexId,
            inkaclubRegistrationStatus: inkaclubRegistrationStatus?.toDomain()
        )
    }
}

extension UpdateUserResponseDTO.InkaclubRegistrationStatusDTO {
    func toDomain() -> InkaclubRegistrationStatus {
        InkaclubRegistrationStatus(
            code: code,
            status: status,
            description: description
        )
    }
}
