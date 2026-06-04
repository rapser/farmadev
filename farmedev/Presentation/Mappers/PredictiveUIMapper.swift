//
//  PredictiveUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension Predictive {

    func toUI() -> PredictiveUI {
        PredictiveUI(
            text: text,
            keywords: keywords.map { $0.keyword }
        )
    }
}
