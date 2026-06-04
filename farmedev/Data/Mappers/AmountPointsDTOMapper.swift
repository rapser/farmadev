//
//  AmountPointsDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension AmountPointsDTO {

    func toDomain() -> AmountPoints {
        AmountPoints(
            code: code ?? 0,
            point: point ?? 0
        )
    }
}
