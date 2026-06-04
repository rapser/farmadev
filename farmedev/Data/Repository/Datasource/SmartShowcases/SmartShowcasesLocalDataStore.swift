//
//  SmartShowcasesLocalDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SmartShowcasesLocalDataStore: SmartShowcasesDataStore {
    
    private let userDefaults = UserDefaults.standard
    private let lastVisitedCategoryKey = "last_visited_category"
    private let lastVisitedProductIdsKey = "last_visited_product_ids"
    
    func isShowcaseActive(name: String) async throws -> Bool {
        // TODO: Implementar
        return false
    }
    
    func getContents(branchOffice: String, whiteLabel: String, email: String, section: String, userId: String?) async throws -> [ShowcaseDTO] {
        // TODO: Implementar
        return []
    }
    
    func captureProduct(title: String, imageUrl: String, productUrl: String, categoryIds: String, productId: String, brand: String, productCategoryId: Int64, price: Double, priceNoDiscount: Double?, salePrice: Double?, isCart: Int) async throws -> EmptyDTO {
        // Guardar producto visitado localmente
        var visitedProductIds = getLastVisitedProductIds()
        if !visitedProductIds.contains(productId) {
            visitedProductIds.append(productId)
            // Mantener solo los últimos N productos (ej: 50)
            if visitedProductIds.count > 50 {
                visitedProductIds.removeFirst()
            }
            userDefaults.set(visitedProductIds, forKey: lastVisitedProductIdsKey)
        }
        return EmptyDTO()
    }
    
    func captureCategory(categoryId: String) async throws -> EmptyDTO {
        userDefaults.set(categoryId, forKey: lastVisitedCategoryKey)
        return EmptyDTO()
    }
    
    func getLastVisitedCategory() -> String {
        return userDefaults.string(forKey: lastVisitedCategoryKey) ?? ""
    }
    
    func getLastVisitedProductIds() -> [String] {
        return userDefaults.stringArray(forKey: lastVisitedProductIdsKey) ?? []
    }
}
