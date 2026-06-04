//
//  ConfirmCartUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension ConfirmCart {

    func toUI() -> ConfirmCartUI {
        ConfirmCartUI(
            code: code,
            message: message,
            orderInfo: orderInfo?.toUI(),
            schedule: schedule?.toUI()
        )
    }
}
