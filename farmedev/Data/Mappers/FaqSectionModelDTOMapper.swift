//
//  FaqSectionModelDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension FaqSectionModelDTO {

    func toDomain() -> FaqSectionModel {
        FaqSectionModel(
            sections: sections?.map { $0.toDomain() } ?? []
        )
    }
}
