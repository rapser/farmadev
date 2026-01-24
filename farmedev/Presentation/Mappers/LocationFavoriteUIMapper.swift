//
//  LocationFavoriteUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension LocationFavorite {

    func toUI() -> LocationFavoriteUI {
        LocationFavoriteUI(
            id: drugstoreStockId,
            address: "\(addressName) \(addressNumber)".trimmingCharacters(in: .whitespaces),
            inCoverage: inCoverage,
            isEnabled: enabled
        )
    }
}
