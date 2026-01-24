//
//  HourUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension Hour {

    func toUI() -> HourUI {
        HourUI(
            value: value,
            endValue: endValue,
            text: text,
            displayText: "\(value) - \(endValue)".trimmingCharacters(in: .whitespaces)
        )
    }
}
