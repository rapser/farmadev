//
//  FaqDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension FaqDTO {

    func toDomain() -> Faq {
        Faq(
            id: id ?? 0,
            sectionId: sectionId ?? 0,
            question: question ?? "",
            answer: answer ?? ""
        )
    }
}
