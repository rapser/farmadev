//
//  PhoneNumberDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension PhoneNumberDTO {

    func toDomain() -> PhoneNumber {
        PhoneNumber(
            phoneNumber: phoneNumber ?? ""
        )
    }
}
