//
//  SearchProductRequest.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct SearchProductRequest {
    let order: String?
    let page: Int?
    let query: String?
    let rows: Int?
    let sort: String?
    let categories: [Int]?
    let brands: [String]?
    let presentation: [String]?
    let pharmaceuticalForm: [String]?
    let prescriptionType: [String]?
}
