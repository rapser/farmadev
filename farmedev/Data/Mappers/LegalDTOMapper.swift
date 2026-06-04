//
//  LegalDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension LegalDTO {

    func toDomain() -> Legal {
        Legal(
            id: id ?? "",
            titulo: titulo ?? "",
            descripcion: descripcion ?? "",
            lista: lista?.map { $0.toDomain() } ?? []
        )
    }
}
