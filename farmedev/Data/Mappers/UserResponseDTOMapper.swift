//
//  UserResponseDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension UserResponseDTO {
    func toDomain() -> UserResponse {
        UserResponse(
            code: code,
            message: message,
            data: data?.toDomain()
        )
    }
}
