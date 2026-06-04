//
//  LocationCurrentUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension LocationCurrent {

    func toUI() -> LocationCurrentUI {
        LocationCurrentUI(
            drugstoreStockId: drugstoreStockId,
            inCoverage: inCoverage,
            isEnabled: enabled,
            coordinates: String(format: "%.6f, %.6f", latitude, longitude)
        )
    }
}
