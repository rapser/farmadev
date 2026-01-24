//
//  SearchProductDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct SearchProductDTO: Codable {
    let data: PaginatedProductDTO?
    let responseCode: String?
    let message: String?
    
    // Modelos auxiliares incluidos directamente
    struct PaginatedProductDTO: Codable {
        let total: Int?
        let page: Int?
        let records: Int?
        let totalRecords: Int?
        let rows: [ProductPackDTO]?
        let categories: [CategoryListDTO]?
        let brands: [String]?
        let presentation: [String]?
        let pharmaceuticalForm: [String]?
        let prescriptionType: [PrescriptionTypeDTO]?
    }
    
    struct CategoryListDTO: Codable {
        let id: String?
        let name: String?
        let check: String?
        let checkTemp: String?
    }
    
    struct PrescriptionTypeDTO: Codable {
        let id: String?
        let code: String?
        let name: String?
        let check: String?
        let checkTemp: String?
    }
}
