//
//  NearDrugstoreDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension NearDrugstoreDTO {

    func toDomain() -> NearDrugstore {
        NearDrugstore(
            id: id ?? 0,
            name: name ?? "",
            address: address ?? "",
            distance: distance ?? 0,
            latitude: latitude ?? 0,
            longitude: longitude ?? 0,
            localCode: localCode ?? "",
            openingHours: localOpeningHours ?? "",
            isDefault: defaultDrugstore ?? false
        )
    }
}
