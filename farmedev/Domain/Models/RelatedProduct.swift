//
//  RelatedProduct.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct RelatedProduct {
    let itemList: [Related]
    
    // Modelos auxiliares incluidos directamente
    struct Related {
        let list: RelatedList?
    }
    
    struct RelatedList {
        let title: String
        let productForSaleList: [ProductDashboard]
        let products: [ProductPack]
    }
}
