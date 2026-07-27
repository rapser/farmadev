//
//  LoginView.swift
//  farmedev
//

import SwiftUI

struct LoginView: View {
    @Environment(AuthCoordinator.self) private var coordinator
    @State private var email: String = ""

    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemBackground).ignoresSafeArea()
            VStack(spacing: 0) {
                LoginHeaderView()
                formSection
            }
        }
        .navigationBarHidden(true)
    }

    private var formSection: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 20)
            VStack(alignment: .leading, spacing: 24) {
                LoginEmailForm(email: $email)
                // Social login intentionally out of scope (no real OAuth) — see PLAN.md 2.10.
                registerLink
            }
            .padding(.horizontal, 24)
            Spacer(minLength: 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private var registerLink: some View {
        HStack(spacing: 4) {
            Text("¿No tienes cuenta?")
                .font(.system(size: 15))
                .foregroundStyle(.secondary)
            Button(action: { coordinator.showRegister() }) {
                Text("Regístrate")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(Color.loginLinkPurple)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    AuthCoordinatorView(coordinator: AuthCoordinator())
        .environment(AppState())
}
