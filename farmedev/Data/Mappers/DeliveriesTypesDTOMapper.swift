//
//  DeliveriesTypesDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DeliveriesTypesDTO {

    func toDomain() -> DeliveriesTypes {
        DeliveriesTypes(
            id: id ?? 0,
            name: name ?? "",
            selected: selected ?? false,
            enabled: enabled ?? false,
            endHour: endHour ?? "",
            intervalTime: intervalTime ?? 0,
            serviceCost: serviceCost ?? 0,
            startHour: startHour ?? "",
            serviceNew: serviceNew ?? false
        )
    }
}
