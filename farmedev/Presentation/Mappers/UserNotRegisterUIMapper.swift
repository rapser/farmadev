//
//  UserNotRegisterUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension UserNotRegister {

    func toUI() -> UserNotRegisterUI {
        UserNotRegisterUI(
            email: email,
            provider: provider,
            source: source,
            state: "\(state)"
        )
    }
}
