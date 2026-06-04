//
//  RelatedProductUI.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct RelatedProductUI {
    let items: [RelatedListUI]
    
    struct RelatedListUI {
        let title: String
        let products: [ProductPackUI]
    }
}
