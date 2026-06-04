//
//  DocumentTypeDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DocumentTypeDTO {

    func toDomain() -> DocumentType {
        DocumentType(
            id: id ?? 0,
            name: name ?? "",
            code: code ?? ""
        )
    }
}
