//
//  StoreOrderDTOMapper.swift
//  farmedev
//

import Foundation

private let isoFormatterWithFractional: ISO8601DateFormatter = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    return formatter
}()

private let isoFormatter = ISO8601DateFormatter()

extension StoreOrderDTO {
    func toDomain() -> StoreOrder {
        let date = isoFormatterWithFractional.date(from: createdAt) ?? isoFormatter.date(from: createdAt) ?? Date()
        return StoreOrder(
            id: id,
            status: status,
            paymentMethod: paymentMethod,
            subtotal: Double(subtotal) ?? 0,
            total: Double(total) ?? 0,
            deliveryAddressLine: deliveryAddressLine,
            deliveryDistrict: deliveryDistrict,
            deliveryReference: deliveryReference,
            items: items.map {
                StoreOrderItem(
                    productId: $0.productId,
                    productName: $0.productNameSnapshot,
                    unitPrice: Double($0.unitPrice) ?? 0,
                    quantity: $0.quantity,
                    lineTotal: Double($0.lineTotal) ?? 0
                )
            },
            createdAt: date
        )
    }
}
