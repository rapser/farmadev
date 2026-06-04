//
//  SettingListDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension SettingListDTO {

    func toDomain() -> SettingList {
        SettingList(
            parameters: parameters?.map { $0.toDomain() } ?? []
        )
    }
}
