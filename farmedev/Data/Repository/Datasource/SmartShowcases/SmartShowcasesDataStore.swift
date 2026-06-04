//
//  SmartShowcasesDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol SmartShowcasesDataStore {
    func isShowcaseActive(name: String) async throws -> Bool
    func getContents(branchOffice: String, whiteLabel: String, email: String, section: String, userId: String?) async throws -> [ShowcaseDTO]
    func captureProduct(title: String, imageUrl: String, productUrl: String, categoryIds: String, productId: String, brand: String, productCategoryId: Int64, price: Double, priceNoDiscount: Double?, salePrice: Double?, isCart: Int) async throws -> EmptyDTO
    func captureCategory(categoryId: String) async throws -> EmptyDTO
    func getLastVisitedCategory() -> String
    func getLastVisitedProductIds() -> [String]
}
