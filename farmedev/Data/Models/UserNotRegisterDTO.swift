//
//  UserNotRegisterDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct UserNotRegisterDTO: Codable {
    let email: String?
    let provider: String?
    let source: String?
    let state: Int?
}
