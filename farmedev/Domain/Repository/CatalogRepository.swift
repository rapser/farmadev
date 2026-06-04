//
//  CatalogRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol CatalogRepository {
    func searchPredictiveKeyword(query: String) async throws -> [PredictiveKeyword]
    
    func getSearchHistory() async throws -> SearchHistoryList
    
    func searchProduct(request: SearchProductRequest) async throws -> SearchProduct
    
    func deleteSearchHistory(id: Int) async throws -> Bool
    
    func getAndSaveCategory() async throws -> Bool
    
    func getCategoryOffLine() async throws -> [GroupCategory]
    
    func getProductsByCategory(catId: Int, page: Int, size: Int, sort: String, order: String) async throws -> SearchProduct.PaginatedProduct
}
