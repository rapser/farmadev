//
//  ViaDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ViaDTO {

    func toDomain() -> Via {
        Via(
            id: id ?? 0,
            name: name ?? ""
        )
    }
}
