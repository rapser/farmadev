//
//  CatalogUseCase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CatalogUseCase {
    private let catalogRepository: CatalogRepository
    
    init(catalogRepository: CatalogRepository) {
        self.catalogRepository = catalogRepository
    }
    
    func searchPredictiveKeyword(query: String) async throws -> [PredictiveKeyword] {
        try await catalogRepository.searchPredictiveKeyword(query: query)
    }
    
    func getSearchHistory() async throws -> SearchHistoryList {
        try await catalogRepository.getSearchHistory()
    }
    
    func searchProduct(request: SearchProductRequest) async throws -> SearchProduct {
        try await catalogRepository.searchProduct(request: request)
    }
    
    func deleteSearchHistory(id: Int) async throws -> Bool {
        try await catalogRepository.deleteSearchHistory(id: id)
    }
    
    func getCategories() async throws -> Bool {
        try await catalogRepository.getAndSaveCategory()
    }
    
    func getCategoriesOffLine() async throws -> [GroupCategory] {
        try await catalogRepository.getCategoryOffLine()
    }
    
    func getProductsByCategory(catId: Int, page: Int, size: Int, sort: String, order: String) async throws -> SearchProduct.PaginatedProduct {
        try await catalogRepository.getProductsByCategory(catId: catId, page: page, size: size, sort: sort, order: order)
    }
}
