//
//  SmartShowcasesCloudDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SmartShowcasesCloudDataStore: SmartShowcasesDataStore {
    
    func isShowcaseActive(name: String) async throws -> Bool {
        // TODO: Implementar llamada a API
        throw NSError(domain: "SmartShowcasesCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getContents(branchOffice: String, whiteLabel: String, email: String, section: String, userId: String?) async throws -> [ShowcaseDTO] {
        // TODO: Implementar llamada a API
        throw NSError(domain: "SmartShowcasesCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func captureProduct(title: String, imageUrl: String, productUrl: String, categoryIds: String, productId: String, brand: String, productCategoryId: Int64, price: Double, priceNoDiscount: Double?, salePrice: Double?, isCart: Int) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "SmartShowcasesCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func captureCategory(categoryId: String) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "SmartShowcasesCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getLastVisitedCategory() -> String {
        return ""
    }
    
    func getLastVisitedProductIds() -> [String] {
        return []
    }
}
