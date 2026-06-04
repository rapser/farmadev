//
//  AntifraudInfoDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension AntifraudInfoDTO {

    func toDomain() -> AntifraudInfo {
        AntifraudInfo(
            shoppingCartId: shoppingCartId ?? 0,
            userId: userId ?? "",
            phoneNumber: phoneNumber ?? "",
            email: email ?? "",
            isAnonymous: isAnonymous ?? "",
            amount: amount ?? 0,
            identityDocumentNumber: identityDocumentNumber ?? "",
            drugstore: drugstore ?? "",
            dateCreated: dateCreated ?? "",
            district: district ?? "",
            ubigeo: ubigeo ?? "",
            address: address ?? "",
            name: name ?? "",
            lastname: lastname ?? "",
            city: city ?? ""
        )
    }
}
