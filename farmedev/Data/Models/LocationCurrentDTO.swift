//
//  LocationCurrentDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct LocationCurrentDTO: Codable {
    let drugstoreStockId: String?
    let inCoverage: Bool?
    let enabled: Bool?
    let latitude: Double?
    let longitude: Double?
    let zoneId: Int?
}
