//
//  ScheduleMessageUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension ScheduleMessage {

    func toUI() -> ScheduleMessageUI {
        ScheduleMessageUI(
            title: title,
            body: body,
            text: text,
            scheduleText: "\(day) \(hour) - \(endHour)".trimmingCharacters(in: .whitespaces)
        )
    }
}
