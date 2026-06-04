//
//  AuthCoordinator.swift
//  farmedev
//

import SwiftUI

enum AuthRoute: Hashable {
    case loginPassword(email: String)
    case register
    case resetPassword
}

@Observable
final class AuthCoordinator {
    var path = NavigationPath()

    func showLoginPassword(email: String) {
        path.append(AuthRoute.loginPassword(email: email))
    }

    func showRegister() {
        path.append(AuthRoute.register)
    }

    func showResetPassword() {
        path.append(AuthRoute.resetPassword)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}
