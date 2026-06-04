//
//  ViaListUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ViaList {

    func toUI() -> ViaListUI {
        ViaListUI(
            vias: vias.map { $0.toUI() }
        )
    }
}
