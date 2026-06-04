//
//  LandingListDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct LandingListDTO: Codable {
    let title: String?
    let deepLink: String?
    let itemsPerView: Int?
    let products: [ProductListDTO]?
}
