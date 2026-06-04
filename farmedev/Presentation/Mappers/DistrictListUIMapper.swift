//
//  DistrictListUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DistrictList {

    func toUI() -> DistrictListUI {
        DistrictListUI(
            districts: distritos.map { $0.toUI() },
            availabilityMessage: availabilityMessage
        )
    }
}
