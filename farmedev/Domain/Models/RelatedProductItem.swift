//
//  RelatedProductItem.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct RelatedProductList {
    let title: String?
    let products: [ProductPack]
}

enum RelatedProductItem {
    case list(RelatedProductList)
}
