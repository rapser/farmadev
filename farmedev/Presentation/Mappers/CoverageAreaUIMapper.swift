//
//  CoverageAreaUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension CoverageArea {

    func toUI() -> CoverageAreaUI {
        CoverageAreaUI(
            id: UUID().uuidString,
            name: name,
            isEnabled: enabled,
            provinces: provinces.map { $0.toUI() }
        )
    }
}

extension CoverageArea.ProvinceArea {
    func toUI() -> CoverageAreaUI.ProvinceAreaUI {
        CoverageAreaUI.ProvinceAreaUI(
            id: UUID().uuidString,
            name: name,
            districts: districts.map { $0.toUI() }
        )
    }
}

extension CoverageArea.DistrictArea {
    func toUI() -> CoverageAreaUI.DistrictAreaUI {
        CoverageAreaUI.DistrictAreaUI(
            id: UUID().uuidString,
            name: name,
            imageUrl: img?.MD ?? ""
        )
    }
}
