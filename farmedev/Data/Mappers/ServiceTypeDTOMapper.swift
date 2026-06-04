//
//  ServiceTypeDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ServiceTypeDTO {

    func toDomain() -> ServiceType {
        ServiceType(
            brand: brand ?? "",
            enabledDelivery: enabledDelivery ?? false,
            enabledPickup: enabledPickup ?? false
        )
    }
}
