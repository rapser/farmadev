//
//  ConfirmCartDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ConfirmCartDTO {

    func toDomain() -> ConfirmCart {
        ConfirmCart(
            code: code ?? "",
            message: message ?? "",
            orderInfo: orderInfo?.toDomain(),
            schedule: schedule?.toDomain()
        )
    }
}
