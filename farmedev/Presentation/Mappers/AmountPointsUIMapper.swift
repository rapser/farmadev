//
//  AmountPointsUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension AmountPoints {

    func toUI() -> AmountPointsUI {
        AmountPointsUI(
            code: code,
            points: "\(point)"
        )
    }
}
