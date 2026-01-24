//
//  NearDrugstoreUI.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension NearDrugstore {

    func toUI() -> NearDrugstoreUI {
        NearDrugstoreUI(
            title: name,
            subtitle: address,
            distanceText: String(format: "%.1f km", distance),
            openingHours: openingHours,
            isDefault: isDefault
        )
    }
}
