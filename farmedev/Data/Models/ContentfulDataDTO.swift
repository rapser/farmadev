//
//  ContentfulDataDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct ContentfulDataDTO: Codable {
    let title: String?
    let slug: String?
    let description: String?
    let items: [ContentfulDataItemDTO]?
}

struct ContentfulDataItemDTO: Codable {
    let title: String?
    let content: String?
}
