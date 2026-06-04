//
//  FaqUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension Faq {

    func toUI() -> FaqUI {
        FaqUI(
            id: id,
            question: question,
            answer: answer
        )
    }
}
