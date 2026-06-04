//
//  SearchProductUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension SearchProduct {

    func toUI() -> SearchProductUI {
        let paginated = data ?? SearchProduct.PaginatedProduct(
            total: 0,
            page: 0,
            records: 0,
            totalRecords: 0,
            rows: [],
            categories: [],
            brands: [],
            presentation: [],
            pharmaceuticalForm: [],
            prescriptionType: []
        )
        
        let totalPages = paginated.records > 0 ? Int(ceil(Double(paginated.totalRecords) / Double(paginated.records))) : 0
        
        return SearchProductUI(
            products: paginated.rows.map { $0.toUI() },
            totalResults: paginated.totalRecords,
            currentPage: paginated.page,
            totalPages: totalPages,
            categories: paginated.categories.map { $0.toUI() }
        )
    }
}

extension SearchProduct.CategoryList {
    func toUI() -> SearchProductUI.CategoryListUI {
        SearchProductUI.CategoryListUI(
            id: id,
            name: name,
            isSelected: check.lowercased() == "true" || check == "1"
        )
    }
}
