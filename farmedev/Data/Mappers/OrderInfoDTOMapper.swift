//
//  OrderInfoDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension OrderInfoDTO {

    func toDomain() -> OrderInfo {
        OrderInfo(
            shoppingCartId: shoppingCartId ?? "",
            shoppingCartStatus: shoppingCartStatus ?? "",
            shoppingCartStatusid: shoppingCartStatusid ?? "",
            deliveryTime: deliveryTime ?? 0,
            deliveryCost: deliveryCost ?? 0,
            totalCost: totalCost ?? 0,
            discountApplied: discountApplied ?? 0,
            orderDate: orderDate ?? 0,
            deliveryType: deliveryType ?? "",
            deliveryTypeDescription: deliveryTypeDescription ?? "",
            pickupAddress: pickupAddress ?? "",
            orderDateConfirm: orderDateConfirm ?? "",
            paymentMethod: paymentMethod?.toDomain(),
            address: address?.toDomain(),
            personToPickUp: personToPickUp?.toDomain()
        )
    }
}
