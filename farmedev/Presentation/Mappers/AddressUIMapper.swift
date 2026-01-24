//
//  AddressUIMapper.swift .swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension AddressUI {

    func toDomain(
        latitude: Double,
        longitude: Double
    ) -> Address {
        Address(
            id: id,
            name: title,
            address: subtitle,
            latitude: latitude,
            longitude: longitude
        )
    }
}

extension Address {

    func toUI() -> AddressUI {
        AddressUI(
            id: id,
            title: name,
            subtitle: address
        )
    }
}
