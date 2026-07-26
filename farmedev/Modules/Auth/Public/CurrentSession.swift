//
//  CurrentSession.swift
//  farmedev
//
//  Bridge so modules that only depend on Modules/Auth/Public (never App/AppState directly)
//  can still read session state. AppState assigns itself here once, at init.
//

import Foundation

enum CurrentSession {
    static var provider: AuthSessionProviding?

    static var isLoggedIn: Bool {
        provider?.isLoggedIn ?? false
    }
}
