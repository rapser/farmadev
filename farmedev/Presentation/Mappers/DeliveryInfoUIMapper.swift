//
//  DeliveryInfoUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension DeliveryInfo {

    func toUI() -> DeliveryInfoUI {
        DeliveryInfoUI(
            addresses: address.map { $0.toUI() },
            paymentMethods: paymentMethods.map { $0.toUI() },
            deliveryTypes: deliveriesTypes.map { $0.toUI() },
            serviceTypes: serviceTypes.map { $0.toUI() },
            isActiveThird: isActiveThird
        )
    }
}
