//
//  SearchHistoryListUI.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct SearchHistoryListUI {
    let history: [SearchHistoryUI]
    
    struct SearchHistoryUI: Identifiable {
        let id: Int
        let text: String
    }
}
