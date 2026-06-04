//
//  DiscountDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct DiscountDTO: Codable {
    let id: Int64?
    let name: String?
    let type: String?
    let isEnable: String?
    let parameters: [DiscountParameterDTO]?
    
    // Modelo auxiliar incluido directamente
    struct DiscountParameterDTO: Codable {
        let name: String?
        let value: String?
    }
}
