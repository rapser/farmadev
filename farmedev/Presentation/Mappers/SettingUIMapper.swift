//
//  SettingUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension Setting {

    func toUI() -> SettingUI {
        SettingUI(
            id: code,
            title: description,
            value: value
        )
    }
}
