//
//  GroupCategoryUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension GroupCategory {

    func toUI() -> GroupCategoryUI {
        GroupCategoryUI(
            id: id,
            name: name,
            imageUrl: firstImage,
            subcategories: categories.map { $0.toUI() }
        )
    }
}
