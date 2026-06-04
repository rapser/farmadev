//
//  ScheduleMessageDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ScheduleMessageDTO {

    func toDomain() -> ScheduleMessage {
        ScheduleMessage(
            title: title ?? "",
            body: body ?? "",
            day: day ?? "",
            hour: hour ?? "",
            endHour: endHour ?? "",
            scheduled: scheduled ?? "",
            text: text ?? "",
            endDate: endDate ?? 0,
            startDate: startDate ?? 0
        )
    }
}
