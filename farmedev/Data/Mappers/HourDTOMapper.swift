//
//  HourDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension HourDTO {

    func toDomain() -> Hour {
        Hour(
            value: value ?? "",
            endValue: endValue ?? "",
            text: text ?? "",
            day: day ?? "",
            today: today ?? "",
            hourToPickMessage: hourToPickMessage ?? "",
            dayToPickmessage: dayToPickmessage ?? "",
            hoursLocalmessage: hoursLocalmessage ?? "",
            alternativeMessage: alternativeMessage ?? ""
        )
    }
}
