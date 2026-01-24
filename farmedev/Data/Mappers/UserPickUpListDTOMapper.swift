//
//  UserPickUpListDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension UserPickUpListDTO {

    func toDomain() -> UserPickUpList {
        UserPickUpList(
            peopleForStorePickup: peopleForStorePickup?.map { $0.toDomain() } ?? []
        )
    }
}
