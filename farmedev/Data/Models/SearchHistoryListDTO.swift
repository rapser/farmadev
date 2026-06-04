//
//  SearchHistoryListDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct SearchHistoryListDTO: Codable {
    let searchhistory: [SearchHistoryDTO]?
    
    // Modelo auxiliar incluido directamente
    struct SearchHistoryDTO: Codable {
        let id: Int?
        let searchText: String?
    }
}
