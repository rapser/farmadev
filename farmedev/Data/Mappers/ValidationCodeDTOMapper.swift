//
//  ValidationCodeDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ValidationCodeDTO {

    func toDomain() -> ValidationCode {
        ValidationCode(
            value: value ?? ""
        )
    }
}
