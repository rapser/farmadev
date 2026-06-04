//
//  MotorizedDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct MotorizedDTO: Codable {
    let etaReturn: Int?
    let latitude: Double?
    let longitude: Double?
    let device: DeviceDTO?
}

struct DeviceDTO: Codable {
    let imei: String?
    let phoneMark: String?
    let phoneModel: String?
    let phoneNumber: String?
}
