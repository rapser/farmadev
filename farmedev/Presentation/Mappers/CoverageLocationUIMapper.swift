//
//  CoverageLocationUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CoverageLocation {

    func toUI() -> CoverageLocationUI {
        CoverageLocationUI(
            current: current.toUI(),
            favorite: favorite?.toUI()
        )
    }
}
