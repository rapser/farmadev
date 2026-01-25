//
//  RucResponseDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension RucResponseDTO {
    func toDomain() -> RucResponse {
        RucResponse(
            code: code,
            message: message
        )
    }
}
