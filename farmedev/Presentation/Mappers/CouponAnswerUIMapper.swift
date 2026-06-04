//
//  CouponAnswerUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CouponAnswer {

    func toUI() -> CouponAnswerUI {
        CouponAnswerUI(
            companyName: companyName,
            coupons: data.map { $0.toUI() },
            categories: familyCategory.map { $0.toUI() }
        )
    }
}

extension CouponAnswer.FamilyCategory {
    func toUI() -> CouponAnswerUI.FamilyCategoryUI {
        CouponAnswerUI.FamilyCategoryUI(
            id: code,
            description: description
        )
    }
}
