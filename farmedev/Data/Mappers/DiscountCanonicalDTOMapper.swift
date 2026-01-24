//
//  DiscountCanonicalDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DiscountCanonicalDTO {

    func toDomain() -> DiscountCanonical {
        DiscountCanonical(
            id: id ?? 0,
            code: code ?? "",
            name: name ?? ""
        )
    }
}
