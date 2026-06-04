//
//  PointsUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension Points {

    func toUI() -> PointsUI {
        PointsUI(
            totalPoints: "\(points)",
            equivalentToSoles: String(format: "%.2f", pointsEquivalentToSoles),
            earnedThisMonth: String(format: "%.2f", pointsEarnedMonth),
            dueThisMonth: String(format: "%.2f", pointsDueMonth),
            redeemedThisMonth: "\(pointsRedeemedMonth)",
            last12Months: String(format: "%.2f", pointsLast12Months),
            saved12Months: String(format: "%.2f", amountSaved12Months)
        )
    }
}
