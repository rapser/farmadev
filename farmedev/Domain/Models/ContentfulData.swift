//
//  ContentfulData.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct ContentfulData {
    let title: String?
    let slug: String?
    let description: String?
    let items: [ContentfulDataItem]?
}

struct ContentfulDataItem {
    let title: String?
    let content: String?
}
