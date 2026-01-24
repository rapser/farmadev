//
//  NearDrugstoreDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct NearDrugstoreDTO: Codable {
    let id: Int?
    let name: String?
    let address: String?
    let distance: Double?
    let latitude: Double?
    let longitude: Double?
    let localCode: String?
    let localOpeningHours: String?
    let defaultDrugstore: Bool?
}
