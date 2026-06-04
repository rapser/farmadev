//
//  DeliveriesTypesDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct DeliveriesTypesDTO: Codable {
    let id: Int?
    let name: String?
    let selected: Bool?
    let enabled: Bool?
    let endHour: String?
    let intervalTime: Float?
    let serviceCost: Float?
    let startHour: String?
    let serviceNew: Bool?
}
