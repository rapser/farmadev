//
//  SmartShowcasesRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol SmartShowcasesRepository {
    func isShowcaseActive(name: String) async throws -> Bool
    
    func getContent(branchOffice: String, whiteLabel: String, email: String, section: String, userId: String?) async throws -> [Showcase]
    
    func captureProduct(product: ProductList, productUrl: String, isCart: Bool) async throws -> Bool
    
    func captureCategory(categoryId: String) async throws -> Bool
    
    func getLastVisitedCategory() -> String
    
    func getLastVisitedProductIds() -> [String]
}
