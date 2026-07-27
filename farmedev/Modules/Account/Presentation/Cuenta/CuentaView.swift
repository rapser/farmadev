//
//  CuentaView.swift
//  farmedev
//

import SwiftUI

struct CuentaView: View {
    @Environment(AppState.self) private var appState
    @Environment(AccountCoordinator.self) private var coordinator

    var body: some View {
        Group {
            if appState.isLoggedIn {
                signedInContent
            } else {
                guestPrompt
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Mi cuenta")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var signedInContent: some View {
        ScrollView {
            VStack(spacing: 16) {
                CuentaProfileCard()
                CuentaQuickActions(
                    onProfile: { coordinator.showProfile() },
                    onOrders: { coordinator.showOrders() },
                    onFavorites: { coordinator.showFavorites() }
                )
                CuentaOptionsList(onAddresses: { coordinator.showAddresses() })
                logoutButton
            }
            .padding(16)
            .padding(.bottom, 100)
        }
    }

    private var guestPrompt: some View {
        VStack(spacing: 16) {
            Spacer()
            Image(systemName: "person.crop.circle")
                .font(.system(size: 56))
                .foregroundStyle(Color.loginLinkPurple.opacity(0.7))
            Text("Inicia sesión para ver tu cuenta")
                .font(.system(size: 17, weight: .bold))
            Text("Consulta tus pedidos, favoritos y datos de perfil.")
                .font(.system(size: 14))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Button(action: { appState.requireAuth {} }) {
                Text("Iniciar sesión")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: 220)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 14).fill(Color.loginHeaderOrange))
            }
            Spacer()
        }
    }

    private var logoutButton: some View {
        Button { Task { await appState.logout() } } label: {
            HStack {
                Image(systemName: "rectangle.portrait.and.arrow.right").font(.system(size: 18))
                Text("Cerrar sesión").font(.system(size: 16, weight: .medium))
            }
            .foregroundStyle(.primary).frame(maxWidth: .infinity).padding(.vertical, 16)
        }
        .background(RoundedRectangle(cornerRadius: 16).fill(.white))
        .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
    }
}
