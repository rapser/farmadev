//
//  LocationCurrentDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension LocationCurrentDTO {

    func toDomain() -> LocationCurrent {
        LocationCurrent(
            drugstoreStockId: drugstoreStockId ?? "",
            inCoverage: inCoverage ?? false,
            enabled: enabled ?? false,
            latitude: latitude ?? 0,
            longitude: longitude ?? 0,
            zoneId: zoneId ?? 0
        )
    }
}
