//
//  UserResponseDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct UserResponseDTO: Codable {
    let code: String?
    let message: String?
    let data: UserLoginDTO?
}
