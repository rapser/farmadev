//
//  SearchProduct.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct SearchProduct {
    let data: PaginatedProduct?
    let responseCode: String
    let message: String
    
    // Modelos auxiliares incluidos directamente
    struct PaginatedProduct {
        let total: Int
        let page: Int
        let records: Int
        let totalRecords: Int
        let rows: [ProductPack]
        let categories: [CategoryList]
        let brands: [String]
        let presentation: [String]
        let pharmaceuticalForm: [String]
        let prescriptionType: [PrescriptionType]
    }
    
    struct CategoryList {
        let id: String
        let name: String
        let check: String
        let checkTemp: String
    }
    
    struct PrescriptionType {
        let id: String
        let code: String
        let name: String
        let check: String
        let checkTemp: String
    }
}
