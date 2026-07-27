//
//  StoreBannerDTO.swift
//  farmedev
//

import Foundation

struct StoreBannerDTO: Decodable {
    let id: String
    let placement: String
    let imageUrl: String
    let title: String?
    let actionType: String
    let actionValue: String?
}
