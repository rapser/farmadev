//
//  AppVersionUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension AppVersion {

    func toUI() -> AppVersionUI {
        AppVersionUI(
            version: version,
            message: message
        )
    }
}
