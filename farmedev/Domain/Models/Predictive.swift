//
//  Predictive.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct Predictive {
    let text: String
    let keywords: [PredictiveKeyword]
    
    // Modelo auxiliar incluido directamente
    struct PredictiveKeyword {
        let keyword: String
    }
}
