//
//  SettingListUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension SettingList {

    func toUI() -> SettingListUI {
        SettingListUI(
            settings: parameters.map { $0.toUI() }
        )
    }
}
