//
//  AuthUserDTOMapper.swift
//  farmedev
//

import Foundation

extension AuthUserDTO {
    func toDomain() -> AuthUser {
        AuthUser(id: id, email: email, fullName: fullName, surname: surname, phone: phone)
    }
}
