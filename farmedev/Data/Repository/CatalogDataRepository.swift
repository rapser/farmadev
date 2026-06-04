//
//  CatalogDataRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class CatalogDataRepository: CatalogRepository {
    
    private let catalogDataStoreFactory: CatalogDataStoreFactory
    
    init(catalogDataStoreFactory: CatalogDataStoreFactory) {
        self.catalogDataStoreFactory = catalogDataStoreFactory
    }
    
    func searchPredictiveKeyword(query: String) async throws -> [PredictiveKeyword] {
        let cloudDataStore = catalogDataStoreFactory.createCloud()
        let predictiveDTO = try await cloudDataStore.searchPredictiveKeyword(query: query)
        
        // Convertir PredictiveDTO a [PredictiveKeyword]
        return predictiveDTO.keywords?.map { keywordDTO in
            PredictiveKeyword(keyword: keywordDTO.keyword)
        } ?? []
    }
    
    func getSearchHistory() async throws -> SearchHistoryList {
        let cloudDataStore = catalogDataStoreFactory.createCloud()
        let searchHistoryDTO = try await cloudDataStore.getSearchHistory()
        return searchHistoryDTO.toDomain()
    }
    
    func searchProduct(request: SearchProductRequest) async throws -> SearchProduct {
        let cloudDataStore = catalogDataStoreFactory.createCloud()
        let searchProductDTO = try await cloudDataStore.searchProduct(request: request)
        return searchProductDTO.toDomain()
    }
    
    func deleteSearchHistory(id: Int) async throws -> Bool {
        let cloudDataStore = catalogDataStoreFactory.createCloud()
        _ = try await cloudDataStore.deleteSearchHistory(id: id)
        return true
    }
    
    func getAndSaveCategory() async throws -> Bool {
        let cloudDataStore = catalogDataStoreFactory.createCloud()
        let localDataStore = catalogDataStoreFactory.createLocal()
        
        let categoriesDTO = try await cloudDataStore.getCategory()
        _ = localDataStore.saveCategory(categories: categoriesDTO)
        return true
    }
    
    func getCategoryOffLine() async throws -> [GroupCategory] {
        let localDataStore = catalogDataStoreFactory.createLocal()
        let categoriesDTO = try await localDataStore.getCategoryOffLine()
        return categoriesDTO.map { $0.toDomain() }
    }
    
    func getProductsByCategory(catId: Int, page: Int, size: Int, sort: String, order: String) async throws -> SearchProduct.PaginatedProduct {
        let cloudDataStore = catalogDataStoreFactory.createCloud()
        let searchProductDTO = try await cloudDataStore.getProductsByCategory(
            catId: catId,
            page: page,
            size: size,
            sort: sort,
            order: order
        )
        
        guard let paginatedProductDTO = searchProductDTO.data else {
            throw NSError(domain: "CatalogDataRepository", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data available"])
        }
        
        return paginatedProductDTO.toDomain()
    }
}
