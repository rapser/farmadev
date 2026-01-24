//
//  UserLoginUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension UserLogin {

    func toUI() -> UserLoginUI {
        UserLoginUI(
            id: id,
            fullName: "\(name) \(paternalLastName) \(maternalLastName)".trimmingCharacters(in: .whitespaces),
            email: email,
            phone: phone,
            photoUrl: photoUrl,
            isAnonymous: isAnonymous
        )
    }
}
