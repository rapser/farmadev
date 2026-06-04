//
//  ProductListDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ProductListDTO {

    func toDomain() -> ProductList {
        ProductList(
            id: id ?? "",
            name: name ?? "",
            brand: brand ?? "",
            subTotal: subTotal ?? 0,
            shortDescription: shortDescription ?? "",
            longDescription: longDescription ?? "",
            imageList: imageList?.map { $0.toDomain() } ?? [],
            price: price ?? 0,
            fractionatedPrice: fractionatedPrice ?? 0,
            unitPriceSelected: unitPriceSelected ?? 0,
            prescription: prescription ?? "",
            precautions: precautions ?? "",
            sideEffects: sideEffects ?? "",
            howToConsume: howToConsume ?? "",
            type: type ?? "",
            tag: tag ?? "",
            favorite: favorite ?? false,
            presentation: presentation ?? "",
            concentration: concentration ?? "",
            fractionalMode: fractionalMode ?? false,
            quantity: quantity ?? 0,
            activePrinciples: activePrinciples ?? [],
            fractionatedForm: fractionatedForm ?? "",
            fractionatedText: fractionatedText ?? "",
            noFractionatedText: noFractionatedText ?? "",
            productStatusId: productStatusId ?? 0,
            productStatus: productStatus ?? "",
            quantityUnits: quantityUnits ?? 0,
            maxUnitSale: maxUnitSale ?? 0,
            maxUnitSaleFractionated: maxUnitSaleFractionated ?? 0,
            stock: stock ?? 0,
            fractionalStock: fractionalStock ?? 0,
            showStockAlert: showStockAlert ?? "",
            presentationIdSelected: presentationIdSelected ?? 0,
            fractionatedFormSelect: fractionatedFormSelect ?? "",
            quantitySelected: quantitySelected ?? 0,
            limitOfferTime: limitOfferTime ?? "",
            defaultPresentation: defaultPresentation ?? false,
            fractionatedPresentationId: fractionatedPresentationId ?? 0,
            presentationId: presentationId ?? 0,
            skuVariants: skuVariants?.map { $0.toDomain() } ?? [],
            details: details?.map { $0.toDomain() } ?? [],
            categoryList: categoryList?.map { $0.toDomain() } ?? [],
            tagImageUrl: tagImageUrl ?? "",
            alertTagText: alertTagText ?? "",
            priceAllPaymentMethod: priceAllPaymentMethod ?? 0,
            fractionatedPriceAllPaymentMethod: fractionatedPriceAllPaymentMethod ?? 0,
            priceWithpaymentMethod: priceWithpaymentMethod ?? 0,
            fractionatedPriceWithpaymentMethod: fractionatedPriceWithpaymentMethod ?? 0,
            crossOutPL: crossOutPL ?? true,
            crossOutFractionatedPL: crossOutFractionatedPL ?? true,
            paymentMethodCardType: paymentMethodCardType ?? "",
            subTotalAllPaymentMethod: subTotalAllPaymentMethod ?? 0,
            subTotalWithPaymentMethod: subTotalWithPaymentMethod ?? 0
        )
    }
}

extension ProductListDTO.VariantDTO {
    func toDomain() -> ProductList.Variant {
        ProductList.Variant(
            sku: sku ?? "",
            name: name ?? "",
            type: type ?? "",
            code: code ?? "",
            hasStock: hasStock ?? true,
            imageUrl: imageUrl ?? ""
        )
    }
}

extension ProductListDTO.ProductDetailsDTO {
    func toDomain() -> ProductList.ProductDetails {
        ProductList.ProductDetails(
            key: key ?? "",
            title: title ?? "",
            content: content ?? "",
            order: order ?? 0
        )
    }
}

extension ProductListDTO.UrlStringListDTO {
    func toDomain() -> ProductList.UrlStringList {
        ProductList.UrlStringList(
            url: url ?? "",
            thumbnails: thumbnails ?? []
        )
    }
}
