//
//  DistrictListDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DistrictListDTO {

    func toDomain() -> DistrictList {
        DistrictList(
            distritos: distritos?.map { $0.toDomain() } ?? [],
            availabilityMessage: availabilityMessage ?? ""
        )
    }
}
