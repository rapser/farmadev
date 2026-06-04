//
//  CoverageAreaUI.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct CoverageAreaUI: Identifiable {
    let id: String
    let name: String
    let isEnabled: Bool
    let provinces: [ProvinceAreaUI]
    
    struct ProvinceAreaUI: Identifiable {
        let id: String
        let name: String
        let districts: [DistrictAreaUI]
    }
    
    struct DistrictAreaUI: Identifiable {
        let id: String
        let name: String
        let imageUrl: String
    }
}
