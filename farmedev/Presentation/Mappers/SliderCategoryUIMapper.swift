//
//  SliderCategoryUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension SliderCategory {

    func toUI() -> SliderCategoryUI {
        SliderCategoryUI(
            id: UUID().uuidString,
            title: iconTitle,
            iconUrl: iconUrl,
            deepLink: deepLink
        )
    }
}
