//
//  SearchProductUI.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct SearchProductUI {
    let products: [ProductPackUI]
    let totalResults: Int
    let currentPage: Int
    let totalPages: Int
    let categories: [CategoryListUI]
    
    struct CategoryListUI: Identifiable {
        let id: String
        let name: String
        let isSelected: Bool
    }
}
