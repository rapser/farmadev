//
//  ServiceTypeUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ServiceType {

    func toUI() -> ServiceTypeUI {
        ServiceTypeUI(
            brand: brand,
            deliveryEnabled: enabledDelivery,
            pickupEnabled: enabledPickup
        )
    }
}
