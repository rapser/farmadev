//
//  CancelOrderUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CancelOrder {

    func toUI() -> CancelOrderUI {
        CancelOrderUI(
            canCancel: isCancellable
        )
    }
}
