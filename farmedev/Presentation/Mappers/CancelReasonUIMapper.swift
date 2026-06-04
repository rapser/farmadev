//
//  CancelReasonUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CancelReason {

    func toUI() -> CancelReasonUI {
        CancelReasonUI(
            id: id,
            reason: reason
        )
    }
}
