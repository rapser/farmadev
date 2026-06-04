//
//  ShoppingCartDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ShoppingCartDTO {

    func toDomain() -> ShoppingCart {
        ShoppingCart(
            id: id ?? 0,
            precalculation: precalculation?.toDomain(),
            deliveryTime: deliveryTime ?? 0,
            address: address?.toDomain(),
            paymentMethod: paymentMethod?.toDomain(),
            listSubtotal: listSubtotal?.map { $0.toDomain() } ?? [],
            productItemList: productItemList?.map { $0.toDomain() } ?? [],
            requestUid: requestUid ?? "",
            minimumPurchase: minimumPurchase ?? 0,
            minimumPurchaseMessage: minimumPurchaseMessage ?? "",
            minimumPurchaseFlag: minimumPurchaseFlag ?? false,
            code: code ?? "",
            message: message ?? "",
            discountId: discountId ?? 0,
            discountCode: discountCode ?? "",
            warningMessage: warningMessage ?? "",
            warningFlag: warningFlag ?? false,
            discountsList: discountsList?.map { $0.toDomain() } ?? [],
            defaultDelivery: defaultDelivery ?? false,
            orderType: orderType ?? ""
        )
    }
}

extension ShoppingCartDTO.SubTotalDTO {
    func toDomain() -> ShoppingCart.SubTotal {
        ShoppingCart.SubTotal(
            name: name ?? "",
            value: value ?? 0
        )
    }
}
