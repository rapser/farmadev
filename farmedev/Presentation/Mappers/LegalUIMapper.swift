//
//  LegalUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension Legal {

    func toUI() -> LegalUI {
        LegalUI(
            id: id,
            title: titulo,
            description: descripcion,
            items: lista.map { $0.toUI() }
        )
    }
}
