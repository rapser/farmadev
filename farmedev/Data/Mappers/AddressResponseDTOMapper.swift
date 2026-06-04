//
//  AddressResponseDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension AddressResponseDTO {
    func toDomain() -> AddressResponse {
        AddressResponse(id: id)
    }
}
