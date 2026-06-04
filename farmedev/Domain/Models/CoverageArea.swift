//
//  CoverageArea.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct CoverageArea {
    let name: String
    let enabled: Bool
    let provinces: [ProvinceArea]
    
    // Modelos auxiliares incluidos directamente
    struct ProvinceArea {
        let name: String
        let enabled: Bool
        let districts: [DistrictArea]
    }
    
    struct DistrictArea {
        let name: String
        let enabled: Bool
        let img: ImageArea?
        let isNew: Bool
    }
    
    struct ImageArea {
        let XS: String
        let SM: String
        let MD: String
        let LG: String
    }
}
