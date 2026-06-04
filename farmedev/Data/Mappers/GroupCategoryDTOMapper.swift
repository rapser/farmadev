//
//  GroupCategoryDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension GroupCategoryDTO {

    func toDomain() -> GroupCategory {
        GroupCategory(
            id: id ?? 0,
            name: name ?? "",
            firstImage: firstImage ?? "",
            secondImage: secondImage ?? "",
            keyword: keyword ?? "",
            categories: categories?.map { $0.toDomain() } ?? []
        )
    }
}
