//
//  RelatedProductDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension RelatedProductDTO {

    func toDomain() -> RelatedProduct {
        RelatedProduct(
            itemList: itemList?.map { $0.toDomain() } ?? []
        )
    }
}

extension RelatedProductDTO.RelatedDTO {
    func toDomain() -> RelatedProduct.Related {
        RelatedProduct.Related(
            list: list?.toDomain()
        )
    }
}

extension RelatedProductDTO.RelatedListDTO {
    func toDomain() -> RelatedProduct.RelatedList {
        RelatedProduct.RelatedList(
            title: title ?? "",
            productForSaleList: productForSaleList?.map { $0.toDomain() } ?? [],
            products: products?.map { $0.toDomain() } ?? []
        )
    }
}
