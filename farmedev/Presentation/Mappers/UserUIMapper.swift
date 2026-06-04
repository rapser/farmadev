//
//  UserUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension User {

    func toUI() -> UserUI {
        UserUI(
            id: dni,
            fullName: "\(name) \(lastName)".trimmingCharacters(in: .whitespaces),
            email: email,
            phone: phone,
            photoUrl: photoUrl
        )
    }
}
