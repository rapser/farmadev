//
//  CartDTO.swift
//  farmedev
//

import Foundation

struct CartItemProductDTO: Decodable {
    let name: String
    let imageUrl: String
}

struct CartItemDTO: Decodable {
    let productId: String
    let quantity: Int
    let unitPriceSnapshot: String
    let product: CartItemProductDTO?
}

struct CartDTO: Decodable {
    let id: String
    let items: [CartItemDTO]
}
