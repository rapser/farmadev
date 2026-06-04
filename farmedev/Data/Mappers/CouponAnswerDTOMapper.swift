//
//  CouponAnswerDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CouponAnswerDTO {

    func toDomain() -> CouponAnswer {
        CouponAnswer(
            companyName: companyName ?? "",
            data: data?.map { $0.toDomain() } ?? [],
            familyCategory: familyCategory?.map { $0.toDomain() } ?? []
        )
    }
}

extension CouponAnswerDTO.FamilyCategoryDTO {
    func toDomain() -> CouponAnswer.FamilyCategory {
        CouponAnswer.FamilyCategory(
            code: code ?? 0,
            description: description ?? ""
        )
    }
}
