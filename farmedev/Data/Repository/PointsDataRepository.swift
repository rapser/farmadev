//
//  PointsDataRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class PointsDataRepository: PointsRepository {
    
    private let pointsDataStoreFactory: PointsDataStoreFactory
    
    init(pointsDataStoreFactory: PointsDataStoreFactory) {
        self.pointsDataStoreFactory = pointsDataStoreFactory
    }
    
    func getPointsData(docNumber: DocNumberRequest) async throws -> Points {
        let cloudDataStore = pointsDataStoreFactory.createCloud()
        let pointsDTO = try await cloudDataStore.getPointsData(docNumber: docNumber)
        return pointsDTO.toDomain()
    }
    
    func amountToPoint(shoppingCartDiscount: ShoppingCartDiscount) async throws -> AmountPoints {
        let cloudDataStore = pointsDataStoreFactory.createCloud()
        let amountPointsDTO = try await cloudDataStore.amountToPoint(shoppingCartDiscount: shoppingCartDiscount)
        return amountPointsDTO.toDomain()
    }
}
