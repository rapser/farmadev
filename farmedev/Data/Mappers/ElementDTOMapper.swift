//
//  ElementDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ElementDTO {

    func toDomain() -> Element {
        Element(
            schedules: schedules?.map { $0.toDomain() } ?? [],
            code: code ?? 0,
            title: title ?? "",
            message: message ?? ""
        )
    }
}
