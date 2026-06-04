//
//  ShoppingCartItemDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ShoppingCartItemDTO {

    func toDomain() -> ShoppingCartItem {
        ShoppingCartItem(
            quantity: quantity ?? 0,
            product: product?.toDomain(),
            lam: lam?.toDomain(),
            presentationIdSelected: presentationIdSelected ?? 0
        )
    }
}

extension ShoppingCartItemDTO.ProductDTO {
    func toDomain() -> ShoppingCartItem.Product {
        ShoppingCartItem.Product(
            id: id ?? "",
            name: name ?? "",
            shortDescription: shortDescription ?? "",
            longDescription: longDescription ?? "",
            imageList: imageList?.map { $0.toDomain() } ?? [],
            price: price ?? 0,
            fractionatedPrice: fractionatedPrice ?? 0,
            prescription: prescription ?? "",
            precautions: precautions ?? "",
            sideEffects: sideEffects ?? "",
            howToConsume: howToConsume ?? "",
            type: type ?? "",
            tag: tag ?? "",
            favorite: favorite ?? false,
            presentation: presentation ?? "",
            concentration: concentration ?? "",
            fractionalMode: fractionalMode ?? true,
            fractionatedForm: fractionatedForm ?? "",
            fractionatedText: fractionatedText ?? "",
            noFractionatedText: noFractionatedText ?? "",
            productStatusId: productStatusId ?? 0,
            productStatus: productStatus ?? "",
            quantityUnits: quantityUnits ?? 0,
            maxUnitSale: maxUnitSale ?? 0,
            maxUnitSaleFrationated: maxUnitSaleFrationated ?? 0,
            stock: stock ?? 0,
            fractionalStock: fractionalStock ?? 0,
            showStockAlert: showStockAlert ?? "",
            fractionatedFormSelect: fractionatedFormSelect ?? "",
            fractionatedSelected: fractionatedSelected ?? false,
            presentationIdSelected: presentationIdSelected ?? 0,
            unitPriceSelected: unitPriceSelected ?? 0,
            quantitySelected: quantitySelected ?? 0,
            fractionatedPresentationId: fractionatedPresentationId ?? 0,
            presentationId: presentationId ?? 0,
            priceAllPaymentMethod: priceAllPaymentMethod ?? 0,
            fractionatedPriceAllPaymentMethod: fractionatedPriceAllPaymentMethod ?? 0,
            priceWithpaymentMethod: priceWithpaymentMethod ?? 0,
            fractionatedPriceWithpaymentMethod: fractionatedPriceWithpaymentMethod ?? 0,
            crossOutPL: crossOutPL ?? true,
            crossOutFractionatedPL: crossOutFractionatedPL ?? true,
            paymentMethodCardType: paymentMethodCardType ?? ""
        )
    }
}

extension ShoppingCartItemDTO.UrlDTO {
    func toDomain() -> ShoppingCartItem.Url {
        ShoppingCartItem.Url(url: url ?? "")
    }
}
