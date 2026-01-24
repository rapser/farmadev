//
//  DocumentTypeUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DocumentType {

    func toUI() -> DocumentTypeUI {
        DocumentTypeUI(
            id: id,
            name: name,
            code: code
        )
    }
}
