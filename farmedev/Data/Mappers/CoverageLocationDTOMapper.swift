//
//  CoverageLocationDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CoverageLocationDTO {

    func toDomain() -> CoverageLocation {
        CoverageLocation(
            current: current?.toDomain() ?? LocationCurrent(
                drugstoreStockId: "",
                inCoverage: false,
                enabled: false,
                latitude: 0,
                longitude: 0,
                zoneId: 0
            ),
            favorite: favorite?.toDomain()
        )
    }
}
