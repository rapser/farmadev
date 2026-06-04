//
//  GroupCategoryUI.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct GroupCategoryUI: Identifiable {
    let id: Int64
    let name: String
    let imageUrl: String
    let subcategories: [GroupCategoryUI]
}
