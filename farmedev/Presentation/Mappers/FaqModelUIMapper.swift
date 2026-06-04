//
//  FaqModelUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension FaqModel {

    func toUI() -> FaqModelUI {
        FaqModelUI(
            faqs: faqs.map { $0.toUI() }
        )
    }
}
