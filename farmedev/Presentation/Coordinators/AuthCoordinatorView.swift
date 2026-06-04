//
//  AuthCoordinatorView.swift
//  farmedev
//

import SwiftUI

struct AuthCoordinatorView: View {
    @Bindable var coordinator: AuthCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            LoginView()
                .navigationDestination(for: AuthRoute.self) { route in
                    switch route {
                    case .loginPassword(let email):
                        LoginPasswordView(email: email)
                    case .register:
                        RegisterView()
                    case .resetPassword:
                        ResetPasswordView()
                    }
                }
        }
        .environment(coordinator)
    }
}
