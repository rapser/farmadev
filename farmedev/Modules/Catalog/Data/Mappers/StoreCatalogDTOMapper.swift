//
//  StoreCatalogDTOMapper.swift
//  farmedev
//

import Foundation

extension StoreCategoryDTO {
    func toDomain() -> StoreCategory {
        StoreCategory(id: id, name: name, slug: slug, iconUrl: iconUrl)
    }
}

extension StoreProductDTO {
    func toDomain() -> StoreProduct {
        StoreProduct(
            id: id,
            name: name,
            description: description,
            imageUrl: imageUrl,
            price: Double(price) ?? 0,
            stock: stock,
            categoryId: categoryId,
            requiresPrescription: requiresPrescription,
            isFeatured: isFeatured
        )
    }
}

extension StoreBannerDTO {
    func toDomain() -> StoreBanner {
        StoreBanner(id: id, placement: placement, imageUrl: imageUrl, title: title, actionType: actionType, actionValue: actionValue)
    }
}
