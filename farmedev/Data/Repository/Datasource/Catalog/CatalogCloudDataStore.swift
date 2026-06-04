//
//  CatalogCloudDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CatalogCloudDataStore: CatalogDataStore {
    
    func searchPredictiveKeyword(query: String) async throws -> PredictiveDTO {
        // TODO: Implementar llamada a API REST
        // Por ahora placeholder
        throw NSError(domain: "CatalogCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getSearchHistory() async throws -> SearchHistoryListDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "CatalogCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func searchProduct(request: SearchProductRequest) async throws -> SearchProductDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "CatalogCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func deleteSearchHistory(id: Int) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "CatalogCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getProductsByCategory(catId: Int, page: Int, size: Int, sort: String, order: String) async throws -> SearchProductDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "CatalogCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getCategory() async throws -> [GroupCategoryDTO] {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "CatalogCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func saveCategory(categories: [GroupCategoryDTO]) -> Bool {
        // No se implementa en Cloud
        false
    }
    
    func getCategoryOffLine() async throws -> [GroupCategoryDTO] {
        // No se implementa en Cloud
        []
    }
}
