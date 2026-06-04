//
//  OrderDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension OrderDTO {

    func toDomain() -> Order {
        Order(
            shoppingCartId: shoppingCartId ?? 0,
            shoppingCartStatus: shoppingCartStatus ?? "",
            shoppingCartStatusId: shoppingCartStatusId ?? 0,
            orderStatus: orderStatus?.map { $0.toDomain() } ?? [],
            deliveryTime: deliveryTime ?? 0,
            subtotal: subtotal ?? 0,
            deliveryCost: deliveryCost ?? 0,
            totalRounding: totalRounding ?? 0,
            totalCost: totalCost ?? 0,
            discountApplied: discountApplied ?? 0,
            orderNote: orderNote ?? "",
            address: address?.toDomain(),
            productList: productList?.map { $0.toDomain() } ?? [],
            paymentMethod: paymentMethod?.toDomain(),
            orderDate: orderDate ?? 0,
            deliveryDate: deliveryDate ?? 0,
            tracking: tracking ?? false,
            programmedMessage: programmedMessage ?? "",
            scheduledStartDate: scheduledStartDate ?? 0,
            scheduledEndDate: scheduledEndDate ?? 0,
            deliveryStartDate: deliveryStartDate ?? 0,
            deliveryEndDate: deliveryEndDate ?? 0,
            motorizedId: motorizedId ?? "",
            drugstore: drugstore?.toDomain(),
            shopingCartStatusDate: shopingCartStatusDate ?? 0,
            comesFromScheduled: comesFromScheduled ?? false,
            group: group?.toDomain(),
            voucherType: voucherType ?? "",
            company: company?.toDomain(),
            pickupAddress: pickupAddress ?? "",
            deliveryType: deliveryType ?? "",
            deliveryService: deliveryService ?? 0,
            end: end ?? "",
            urlFirebase: urlFirebase ?? "",
            personToPickUp: personToPickUp?.toDomain(),
            subTotalWithNoSpecificPaymentMethod: subTotalWithNoSpecificPaymentMethod ?? 0,
            totalWithNoSpecificPaymentMethod: totalWithNoSpecificPaymentMethod ?? 0,
            totalWithPaymentMethod: totalWithPaymentMethod ?? 0,
            paymentMethodCardType: paymentMethodCardType ?? ""
        )
    }
}

extension OrderDTO.OrderStatusDTO {
    func toDomain() -> Order.OrderStatus {
        Order.OrderStatus(
            id: id ?? 0,
            name: name ?? "",
            date: date ?? 0,
            code: code ?? ""
        )
    }
}

extension OrderDTO.OrderProductDTO {
    func toDomain() -> Order.OrderProduct {
        Order.OrderProduct(
            productPack: productPack?.toDomain(),
            quantity: quantity ?? 0,
            unitPrice: unitPrice ?? 0,
            fractionalMode: fractionalMode ?? false,
            presentationIdSelected: presentationIdSelected ?? 0
        )
    }
}

extension OrderDTO.DrugstoreDTO {
    func toDomain() -> Order.Drugstore {
        Order.Drugstore(
            address: address ?? "",
            description: description ?? "",
            id: id ?? 0,
            latitude: latitude ?? 0,
            longitude: longitude ?? 0,
            name: name ?? "",
            zone: zone?.map { $0.toDomain() } ?? []
        )
    }
}

extension OrderDTO.ZoneDTO {
    func toDomain() -> Order.Zone {
        Order.Zone(id: id ?? 0)
    }
}

extension OrderDTO.GroupDTO {
    func toDomain() -> Order.Group {
        Order.Group(
            inProcess: inProcess ?? "",
            name: name ?? "",
            order: order ?? 0,
            previous: previous?.map { $0.toDomain() } ?? []
        )
    }
}

extension OrderDTO.PreviousMetadataDTO {
    func toDomain() -> Order.PreviousMetadata {
        Order.PreviousMetadata(
            latitude: latitude ?? 0,
            longitude: longitude ?? 0,
            order: order ?? 0,
            finalized: finalized ?? "",
            id: id ?? 0
        )
    }
}
