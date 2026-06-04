//
//  PointsRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol PointsRepository {
    func getPointsData(docNumber: DocNumberRequest) async throws -> Points
    
    func amountToPoint(shoppingCartDiscount: ShoppingCartDiscount) async throws -> AmountPoints
}
