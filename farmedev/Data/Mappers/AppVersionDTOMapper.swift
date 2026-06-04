//
//  AppVersionDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension AppVersionDTO {

    func toDomain() -> AppVersion {
        AppVersion(
            version: version ?? "",
            message: message ?? ""
        )
    }
}
