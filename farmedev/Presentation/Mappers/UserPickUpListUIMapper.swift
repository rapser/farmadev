//
//  UserPickUpListUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension UserPickUpList {

    func toUI() -> UserPickUpListUI {
        UserPickUpListUI(
            people: peopleForStorePickup.map { $0.toUI() }
        )
    }
}
