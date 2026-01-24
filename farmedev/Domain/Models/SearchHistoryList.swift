//
//  SearchHistoryList.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct SearchHistoryList {
    let searchhistory: [SearchHistory]
    
    // Modelo auxiliar incluido directamente
    struct SearchHistory {
        let id: Int
        let searchText: String
    }
}
