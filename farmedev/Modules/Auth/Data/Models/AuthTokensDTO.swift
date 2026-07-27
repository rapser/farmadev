//
//  AuthTokensDTO.swift
//  farmedev
//

import Foundation

struct AuthSessionDTO: Codable {
    let user: AuthUserDTO
    let accessToken: String
    let refreshToken: String
}

struct ForgotPasswordResponseDTO: Codable {
    let resetToken: String?
}
