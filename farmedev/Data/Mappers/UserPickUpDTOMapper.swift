//
//  UserPickUpDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension UserPickUpDTO {

    func toDomain() -> UserPickUp {
        UserPickUp(
            id: id ?? 0,
            fullName: fullName ?? "",
            email: email ?? "",
            identityDocumenType: identityDocumenType ?? 0,
            identityDocumentNumber: identityDocumentNumber ?? "",
            phone: phone ?? "",
            favorite: favorite ?? false
        )
    }
}
