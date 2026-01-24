//
//  FaqSectionModelUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension FaqSectionModel {

    func toUI() -> FaqSectionModelUI {
        FaqSectionModelUI(
            sections: sections.map { $0.toUI() }
        )
    }
}
