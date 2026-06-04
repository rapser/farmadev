//
//  PointsDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension PointsDTO {

    func toDomain() -> Points {
        Points(
            points: points ?? 0,
            pointsEquivalentToSoles: pointsEquivalentToSoles ?? 0,
            pointsEarnedMonth: pointsEarnedMonth ?? 0,
            pointsDueMonth: pointsDueMonth ?? 0,
            pointsRedeemedMonth: pointsRedeemedMonth ?? 0,
            pointsLast12Months: pointsLast12Months ?? 0,
            amountSaved12Months: amountSaved12Months ?? 0
        )
    }
}
