//
//  RelatedProductDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct RelatedProductDTO: Codable {
    let itemList: [RelatedDTO]?
    
    // Modelos auxiliares incluidos directamente
    struct RelatedDTO: Codable {
        let list: RelatedListDTO?
    }
    
    struct RelatedListDTO: Codable {
        let title: String?
        let productForSaleList: [ProductDashboardDTO]?
        let products: [ProductPackDTO]?
    }
}
