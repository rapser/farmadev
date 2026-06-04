//
//  PointsDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol PointsDataStore {
    func getPointsData(docNumber: DocNumberRequest) async throws -> PointsDTO
    
    func amountToPoint(shoppingCartDiscount: ShoppingCartDiscount) async throws -> AmountPointsDTO
}
