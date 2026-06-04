//
//  CancelListOrderUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CancelListOrder {

    func toUI() -> CancelListOrderUI {
        CancelListOrderUI(
            reasons: cancelReasons.map { $0.toUI() }
        )
    }
}
