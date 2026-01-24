//
//  FaqSectionDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension FaqSectionDTO {

    func toDomain() -> FaqSection {
        FaqSection(
            id: id ?? 0,
            name: name ?? "",
            url: url ?? ""
        )
    }
}
