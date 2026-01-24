//
//  SearchHistoryListUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension SearchHistoryList {

    func toUI() -> SearchHistoryListUI {
        SearchHistoryListUI(
            history: searchhistory.map { $0.toUI() }
        )
    }
}

extension SearchHistoryList.SearchHistory {
    func toUI() -> SearchHistoryListUI.SearchHistoryUI {
        SearchHistoryListUI.SearchHistoryUI(
            id: id,
            text: searchText
        )
    }
}
