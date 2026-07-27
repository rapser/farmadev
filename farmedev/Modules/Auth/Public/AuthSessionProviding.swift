//
//  AuthSessionProviding.swift
//  farmedev
//
//  The only surface other modules (and Core) should depend on for session state —
//  never reach into Modules/Auth/Domain directly. AppState conforms to this.
//

import Foundation

protocol AuthSessionProviding {
    var isLoggedIn: Bool { get }
    var currentUserId: String? { get }
}
