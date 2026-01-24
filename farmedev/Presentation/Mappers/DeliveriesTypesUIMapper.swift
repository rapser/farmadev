//
//  DeliveriesTypesUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension DeliveriesTypes {

    func toUI() -> DeliveriesTypesUI {
        DeliveriesTypesUI(
            id: id,
            name: name,
            isSelected: selected,
            isEnabled: enabled,
            timeRange: "\(startHour) - \(endHour)",
            serviceCost: String(format: "%.2f", serviceCost)
        )
    }
}
