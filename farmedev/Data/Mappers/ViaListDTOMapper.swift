//
//  ViaListDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ViaListDTO {

    func toDomain() -> ViaList {
        ViaList(
            vias: vias?.map { $0.toDomain() } ?? []
        )
    }
}
