//
//  AddressItemUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension AddressItem {

    func toUI() -> AddressItemUI {
        AddressItemUI(
            id: id,
            name: name,
            fullAddress: "\(street) \(number), \(district)".trimmingCharacters(in: .whitespaces),
            isFavorite: favorite
        )
    }
}
