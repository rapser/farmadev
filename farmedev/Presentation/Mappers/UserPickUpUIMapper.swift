//
//  UserPickUpUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension UserPickUp {

    func toUI() -> UserPickUpUI {
        UserPickUpUI(
            id: id,
            fullName: fullName,
            email: email,
            phone: phone,
            isFavorite: favorite
        )
    }
}
