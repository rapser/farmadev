//
//  AddressDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension AddressDTO {

    func toDomain() -> Address {
        Address(
            id: id ?? 0,
            name: name ?? "",
            address: address ?? "",
            latitude: latitude ?? 0,
            longitude: longitude ?? 0
        )
    }
}
