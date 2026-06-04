//
//  DistrictDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DistrictDTO {

    func toDomain() -> District {
        District(
            id: id ?? 0,
            name: name ?? "",
            latitude: latitude ?? 0,
            longitude: longitude ?? 0
        )
    }
}
