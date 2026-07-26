//
//  LoginView.swift
//  farmedev
//

import SwiftUI

struct LoginView: View {
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
            }
            .padding(.horizontal, 24)
            Spacer(minLength: 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    AuthCoordinatorView(coordinator: AuthCoordinator())
        .environment(AppState())
}
