//
//  StoreProduct.swift
//  farmedev
//

import Foundation

struct StoreProduct: Identifiable, Equatable {
    let id: String
    let name: String
    let description: String
    let imageUrl: String
    let price: Double
    let stock: Int
    let categoryId: String?
    let requiresPrescription: Bool
    let isFeatured: Bool
}
