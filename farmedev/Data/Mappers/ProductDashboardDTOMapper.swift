//
//  ProductDashboardDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ProductDashboardDTO {

    func toDomain() -> ProductDashboard {
        ProductDashboard(
            id: id ?? "",
            lam: lam ?? "",
            name: name ?? "",
            favorite: favorite ?? false,
            productStatusId: productStatusId ?? 0,
            pathImage: pathImage ?? "",
            stockAlert: stockAlert ?? "",
            fractionalMode: fractionalMode ?? false,
            fractionalStock: fractionalStock ?? 0,
            packStock: packStock ?? 0,
            fractionalPrice: fractionalPrice ?? 0,
            packPrice: packPrice ?? 0,
            packPresentation: packPresentation ?? "",
            fractionalPresentation: fractionalPresentation ?? "",
            fractionalDescription: fractionalDescription ?? "",
            unitQuantity: unitQuantity ?? 0,
            packDescription: packDescription ?? "",
            maxfractionalUnitSale: maxfractionalUnitSale ?? 0,
            maxPackUnitSale: maxPackUnitSale ?? 0,
            limitOfferTime: limitOfferTime ?? "",
            defaultPresentation: defaultPresentation ?? false,
            shortDescription: shortDescription ?? "",
            longDescription: longDescription ?? "",
            fractionatedPresentationId: fractionatedPresentationId ?? 0,
            presentationId: presentationId ?? 0,
            alertTagText: alertTagText ?? "",
            tagImageUrl: tagImageUrl ?? "",
            prescription: prescription ?? "",
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
