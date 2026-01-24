//
//  FaqSectionUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension FaqSection {

    func toUI() -> FaqSectionUI {
        FaqSectionUI(
            id: id,
            name: name
        )
    }
}
