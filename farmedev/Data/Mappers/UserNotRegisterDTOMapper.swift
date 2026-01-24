//
//  UserNotRegisterDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension UserNotRegisterDTO {

    func toDomain() -> UserNotRegister {
        UserNotRegister(
            email: email ?? "",
            provider: provider ?? "",
            source: source ?? "",
            state: state ?? 0
        )
    }
}
