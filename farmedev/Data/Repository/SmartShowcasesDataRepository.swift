//
//  SmartShowcasesDataRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SmartShowcasesDataRepository: SmartShowcasesRepository {
    
    private let smartShowcaseDataStoreFactory: SmartShowcasesDataStoreFactory
    
    init(smartShowcaseDataStoreFactory: SmartShowcasesDataStoreFactory) {
        self.smartShowcaseDataStoreFactory = smartShowcaseDataStoreFactory
    }
    
    func isShowcaseActive(name: String) async throws -> Bool {
        let contentfulDataStore = smartShowcaseDataStoreFactory.createContentful()
        return try await contentfulDataStore.isShowcaseActive(name: name)
    }
    
    func getContent(branchOffice: String, whiteLabel: String, email: String, section: String, userId: String?) async throws -> [Showcase] {
        let cloudDataStore = smartShowcaseDataStoreFactory.createCloud()
        let showcaseDTOs = try await cloudDataStore.getContents(branchOffice: branchOffice, whiteLabel: whiteLabel, email: email, section: section, userId: userId)
        return showcaseDTOs.map { $0.toDomain() }
    }
    
    func captureProduct(product: ProductList, productUrl: String, isCart: Bool) async throws -> Bool {
        let cloudDataStore = smartShowcaseDataStoreFactory.createCloud()
        let localDataStore = smartShowcaseDataStoreFactory.createLocal()
        
        let imageUrl = product.imageList.first(where: { $0.url.contains("L") })?.url
            ?? product.imageList.first?.url
            ?? ""
        
        let categoryIds = getAllCategoryIds(for: product)
            .map { "\($0)" }
            .joined(separator: ",")
        
        let productCategoryId = getSpecificCategoryId(product: product)
        
        _ = try await cloudDataStore.captureProduct(
            title: product.name,
            imageUrl: imageUrl,
            productUrl: productUrl,
            categoryIds: categoryIds,
            productId: product.id,
            brand: product.brand,
            productCategoryId: productCategoryId,
            price: product.price,
            priceNoDiscount: product.price,
            salePrice: product.price,
            isCart: isCart ? 1 : 0
        )
        
        // Si no es carrito, también guardar localmente
        if !isCart {
            _ = try await localDataStore.captureProduct(
                title: product.name,
                imageUrl: imageUrl,
                productUrl: productUrl,
                categoryIds: categoryIds,
                productId: product.id,
                brand: product.brand,
                productCategoryId: productCategoryId,
                price: product.price,
                priceNoDiscount: product.price,
                salePrice: product.price,
                isCart: isCart ? 1 : 0
            )
        }
        
        return true
    }
    
    func captureCategory(categoryId: String) async throws -> Bool {
        let cloudDataStore = smartShowcaseDataStoreFactory.createCloud()
        let localDataStore = smartShowcaseDataStoreFactory.createLocal()
        
        _ = try await cloudDataStore.captureCategory(categoryId: categoryId)
        _ = try await localDataStore.captureCategory(categoryId: categoryId)
        
        return true
    }
    
    func getLastVisitedCategory() -> String {
        let localDataStore = smartShowcaseDataStoreFactory.createLocal()
        return localDataStore.getLastVisitedCategory()
    }
    
    func getLastVisitedProductIds() -> [String] {
        let localDataStore = smartShowcaseDataStoreFactory.createLocal()
        return localDataStore.getLastVisitedProductIds()
    }
    
    // Helper functions
    private func getAllCategoryIds(for product: ProductList) -> [Int64] {
        var categoryIdList: [Int64] = []
        categoryIdList.append(contentsOf: product.categoryList.map { Int64($0.id) })
        product.categoryList.forEach { category in
            categoryIdList.append(contentsOf: getChildCategoryIds(for: category))
        }
        return categoryIdList
    }
    
    private func getChildCategoryIds(for category: GroupCategory) -> [Int64] {
        var categoryIdList: [Int64] = []
        categoryIdList.append(Int64(category.id))
        category.categories.forEach { childCategory in
            categoryIdList.append(contentsOf: getChildCategoryIds(for: childCategory))
        }
        return categoryIdList
    }
    
    private func getSpecificCategoryId(product: ProductList) -> Int64 {
        var categoryList = product.categoryList
        var category: GroupCategory? = nil
        
        repeat {
            category = categoryList.first
            categoryList = category?.categories ?? []
        } while !categoryList.isEmpty
        
        return Int64(category?.id ?? 0)
    }
}
