//
//  SearchHistoryListDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension SearchHistoryListDTO {

    func toDomain() -> SearchHistoryList {
        SearchHistoryList(
            searchhistory: searchhistory?.map { $0.toDomain() } ?? []
        )
    }
}

extension SearchHistoryListDTO.SearchHistoryDTO {
    func toDomain() -> SearchHistoryList.SearchHistory {
        SearchHistoryList.SearchHistory(
            id: id ?? 0,
            searchText: searchText ?? ""
        )
    }
}
