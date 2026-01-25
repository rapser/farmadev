//
//  MotorizedDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension MotorizedDTO {
    func toDomain() -> Motorized {
        Motorized(
            etaReturn: etaReturn,
            latitude: latitude,
            longitude: longitude,
            device: device?.toDomain()
        )
    }
}

extension DeviceDTO {
    func toDomain() -> Device {
        Device(
            imei: imei,
            phoneMark: phoneMark,
            phoneModel: phoneModel,
            phoneNumber: phoneNumber
        )
    }
}
