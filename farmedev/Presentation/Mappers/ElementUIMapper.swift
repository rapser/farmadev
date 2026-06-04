//
//  ElementUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension Element {

    func toUI() -> ElementUI {
        ElementUI(
            title: title,
            message: message,
            schedules: schedules.map { "\($0.value) - \($0.endValue)" }
        )
    }
}
