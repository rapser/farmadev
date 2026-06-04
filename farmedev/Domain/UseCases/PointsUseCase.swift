//
//  PointsUseCase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class PointsUseCase {
    
    private let pointsRepository: PointsRepository
    
    init(pointsRepository: PointsRepository) {
        self.pointsRepository = pointsRepository
    }
    
    func getDataPoints(docNumber: DocNumberRequest) async throws -> Points {
        try await pointsRepository.getPointsData(docNumber: docNumber)
    }
    
    func amountToPoint(shoppingCartDiscount: ShoppingCartDiscount) async throws -> AmountPoints {
        try await pointsRepository.amountToPoint(shoppingCartDiscount: shoppingCartDiscount)
    }
}
