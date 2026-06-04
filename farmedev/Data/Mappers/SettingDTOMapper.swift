//
//  SettingDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension SettingDTO {

    func toDomain() -> Setting {
        Setting(
            code: code ?? "",
            client: client ?? "",
            description: description ?? "",
            value: value ?? ""
        )
    }
}
