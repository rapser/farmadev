//
//  StoreCategoryDTO.swift
//  farmedev
//

import Foundation

struct StoreCategoryDTO: Decodable {
    let id: String
    let name: String
    let slug: String
    let iconUrl: String?
}
