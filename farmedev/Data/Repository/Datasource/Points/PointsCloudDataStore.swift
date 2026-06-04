//
//  PointsCloudDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class PointsCloudDataStore: PointsDataStore {
    
    func getPointsData(docNumber: DocNumberRequest) async throws -> PointsDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "PointsCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func amountToPoint(shoppingCartDiscount: ShoppingCartDiscount) async throws -> AmountPointsDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "PointsCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
}
