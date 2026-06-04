//
//  CatalogLocalDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CatalogLocalDataStore: CatalogDataStore {
    
    func searchPredictiveKeyword(query: String) async throws -> PredictiveDTO {
        // No se implementa en Local
        throw NSError(domain: "CatalogLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getSearchHistory() async throws -> SearchHistoryListDTO {
        // TODO: Implementar obtención desde almacenamiento local (UserDefaults, CoreData, etc.)
        throw NSError(domain: "CatalogLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func searchProduct(request: SearchProductRequest) async throws -> SearchProductDTO {
        // No se implementa en Local
        throw NSError(domain: "CatalogLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func deleteSearchHistory(id: Int) async throws -> EmptyDTO {
        // TODO: Implementar eliminación desde almacenamiento local
        throw NSError(domain: "CatalogLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getProductsByCategory(catId: Int, page: Int, size: Int, sort: String, order: String) async throws -> SearchProductDTO {
        // No se implementa en Local
        throw NSError(domain: "CatalogLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getCategory() async throws -> [GroupCategoryDTO] {
        // No se implementa en Local
        throw NSError(domain: "CatalogLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func saveCategory(categories: [GroupCategoryDTO]) -> Bool {
        // TODO: Implementar guardado en almacenamiento local (UserDefaults, CoreData, etc.)
        // Por ahora placeholder
        true
    }
    
    func getCategoryOffLine() async throws -> [GroupCategoryDTO] {
        // TODO: Implementar obtención desde almacenamiento local
        throw NSError(domain: "CatalogLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
}
