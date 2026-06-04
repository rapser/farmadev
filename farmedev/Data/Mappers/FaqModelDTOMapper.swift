//
//  FaqModelDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension FaqModelDTO {

    func toDomain() -> FaqModel {
        FaqModel(
            faqs: faqs?.map { $0.toDomain() } ?? []
        )
    }
}
