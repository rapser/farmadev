//
//  PredictiveDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct PredictiveDTO: Codable {
    let text: String?
    let keywords: [PredictiveKeywordDTO]?
    
    // Modelo auxiliar incluido directamente
    struct PredictiveKeywordDTO: Codable {
        let keyword: String?
    }
}
