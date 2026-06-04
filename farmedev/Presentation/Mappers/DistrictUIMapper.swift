//
//  DistrictUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension District {

    func toUI() -> DistrictUI {
        DistrictUI(
            id: id,
            name: name
        )
    }
}
