//
//  DiscountDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DiscountDTO {

    func toDomain() -> Discount {
        Discount(
            id: id ?? 0,
            name: name ?? "",
            type: type ?? "",
            isEnable: isEnable ?? "",
            parameters: parameters?.map { $0.toDomain() } ?? []
        )
    }
}

extension DiscountDTO.DiscountParameterDTO {
    func toDomain() -> Discount.DiscountParameter {
        Discount.DiscountParameter(
            name: name ?? "",
            value: value ?? ""
        )
    }
}
