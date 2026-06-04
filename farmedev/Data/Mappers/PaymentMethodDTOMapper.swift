//
//  PaymentMethodDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension PaymentMethodDTO {

    func toDomain() -> PaymentMethod {
        PaymentMethod(
            id: id ?? 0,
            name: name ?? "",
            imageUrl: imageUrl ?? "",
            creditCardList: creditCardList?.map { $0.toDomain() } ?? [],
            creditCardmodel: creditCardmodel?.toDomain(),
            favorite: favorite ?? false,
            provider: provider ?? "",
            cardName: cardName ?? "",
            type: type ?? "",
            paidAmount: paidAmount ?? 0,
            changeAmount: changeAmount ?? 0
        )
    }
}

extension PaymentMethodDTO.CreditCardDTO {
    func toDomain() -> PaymentMethod.CreditCard {
        PaymentMethod.CreditCard(
            id: id ?? 0,
            name: name ?? "",
            imageUrl: imageUrl ?? "",
            favorite: favorite ?? false,
            descriptionShort: descriptionShort ?? "",
            descriptionLarge: descriptionLarge ?? "",
            colorDescription: colorDescription ?? "",
            cardGroup: cardGroup ?? "",
            paymentMethodPagoWeb: paymentMethodPagoWeb ?? ""
        )
    }
}
