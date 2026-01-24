//
//  RelatedProductUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension RelatedProduct {

    func toUI() -> RelatedProductUI {
        RelatedProductUI(
            items: itemList.compactMap { $0.list?.toUI() }
        )
    }
}

extension RelatedProduct.RelatedList {
    func toUI() -> RelatedProductUI.RelatedListUI {
        RelatedProductUI.RelatedListUI(
            title: title,
            products: products.map { $0.toUI() }
        )
    }
}
