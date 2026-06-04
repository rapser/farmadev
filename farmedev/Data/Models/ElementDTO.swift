//
//  ElementDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct ElementDTO: Codable {
    let schedules: [HourDTO]?
    let code: Int?
    let title: String?
    let message: String?
}
