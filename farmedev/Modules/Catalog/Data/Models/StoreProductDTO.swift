//
//  StoreProductDTO.swift
//  farmedev
//
//  `price` arrives as a JSON string (Postgres `decimal` columns serialize as strings via
//  TypeORM), so it's decoded as String here and parsed to Double in the mapper.
//

import Foundation

struct StoreProductDTO: Decodable {
    let id: String
    let name: String
    let description: String
    let imageUrl: String
    let price: String
    let stock: Int
    let categoryId: String?
    let requiresPrescription: Bool
    let isFeatured: Bool
}
