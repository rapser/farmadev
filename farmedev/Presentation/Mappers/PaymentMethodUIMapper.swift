//
//  PaymentMethodUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension PaymentMethod {

    func toUI() -> PaymentMethodUI {
        PaymentMethodUI(
            id: id,
            name: name,
            imageUrl: imageUrl,
            isFavorite: favorite
        )
    }
}
