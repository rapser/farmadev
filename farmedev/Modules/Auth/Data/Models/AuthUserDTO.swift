//
//  AuthUserDTO.swift
//  farmedev
//

import Foundation

struct AuthUserDTO: Codable {
    let id: String
    let email: String
    let fullName: String
    let surname: String
    let phone: String?
}
