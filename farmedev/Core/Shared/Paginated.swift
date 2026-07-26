//
//  Paginated.swift
//  farmedev
//

import Foundation

struct Paginated<T> {
    let items: [T]
    let total: Int
    let page: Int
    let limit: Int
}

struct PaginatedDTO<T: Decodable>: Decodable {
    let items: [T]
    let total: Int
    let page: Int
    let limit: Int

    func toDomain() -> Paginated<T> {
        Paginated(items: items, total: total, page: page, limit: limit)
    }
}
