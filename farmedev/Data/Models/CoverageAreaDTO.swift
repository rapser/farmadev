//
//  CoverageAreaDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct CoverageAreaDTO: Codable {
    let name: String?
    let enabled: Bool?
    let provinces: [ProvinceAreaDTO]?
    
    // Modelos auxiliares incluidos directamente
    struct ProvinceAreaDTO: Codable {
        let name: String?
        let enabled: Bool?
        let districts: [DistrictAreaDTO]?
    }
    
    struct DistrictAreaDTO: Codable {
        let name: String?
        let enabled: Bool?
        let img: ImageAreaDTO?
        let isNew: Bool?
    }
    
    struct ImageAreaDTO: Codable {
        let XS: String?
        let SM: String?
        let MD: String?
        let LG: String?
    }
}
