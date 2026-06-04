//
//  SmartShowcasesUseCase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SmartShowcasesUseCase {
    private let smartShowcasesRepository: SmartShowcasesRepository
    
    init(smartShowcasesRepository: SmartShowcasesRepository) {
        self.smartShowcasesRepository = smartShowcasesRepository
    }
    
    func isShowcaseActive(name: String) async throws -> Bool {
        try await smartShowcasesRepository.isShowcaseActive(name: name)
    }
    
    func getContent(branchOffice: String, whiteLabel: String, email: String, section: String, userId: String? = nil) async throws -> [Showcase] {
        try await smartShowcasesRepository.getContent(branchOffice: branchOffice, whiteLabel: whiteLabel, email: email, section: section, userId: userId)
    }
    
    func captureProduct(product: ProductList, productUrl: String, isCart: Bool) async throws -> Bool {
        try await smartShowcasesRepository.captureProduct(product: product, productUrl: productUrl, isCart: isCart)
    }
    
    func captureCategory(categoryId: String) async throws -> Bool {
        try await smartShowcasesRepository.captureCategory(categoryId: categoryId)
    }
    
    func getLastVisitedCategory() -> String {
        smartShowcasesRepository.getLastVisitedCategory()
    }
    
    func getLastVisitedProductIds() -> [String] {
        smartShowcasesRepository.getLastVisitedProductIds()
    }
}
