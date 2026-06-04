//
//  CatalogDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol CatalogDataStore {
    func searchPredictiveKeyword(query: String) async throws -> PredictiveDTO
    
    func getSearchHistory() async throws -> SearchHistoryListDTO
    
    func searchProduct(request: SearchProductRequest) async throws -> SearchProductDTO
    
    func deleteSearchHistory(id: Int) async throws -> EmptyDTO
    
    func getProductsByCategory(catId: Int, page: Int, size: Int, sort: String, order: String) async throws -> SearchProductDTO
    
    func getCategory() async throws -> [GroupCategoryDTO]
    
    func saveCategory(categories: [GroupCategoryDTO]) -> Bool
    
    func getCategoryOffLine() async throws -> [GroupCategoryDTO]
}
