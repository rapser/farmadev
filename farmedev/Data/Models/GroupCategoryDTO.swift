//
//  GroupCategoryDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct GroupCategoryDTO: Codable {
    let id: Int64?
    let name: String?
    let firstImage: String?
    let secondImage: String?
    let keyword: String?
    let categories: [GroupCategoryDTO]?
}
