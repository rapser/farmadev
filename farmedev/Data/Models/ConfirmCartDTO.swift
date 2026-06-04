//
//  ConfirmCartDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct ConfirmCartDTO: Codable {
    let code: String?
    let message: String?
    let orderInfo: OrderInfoDTO?
    let schedule: ScheduleMessageDTO?
}
