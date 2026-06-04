//
//  CuentaView.swift
//  farmedev
//

import SwiftUI

struct CuentaView: View {
    @Environment(AppState.self) private var appState

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                CuentaProfileCard()
                CuentaQuickActions()
                CuentaOptionsList()
                logoutButton
            }
            .padding(16)
            .padding(.bottom, 100)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Mi cuenta")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var logoutButton: some View {
        Button { appState.logout() } label: {
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
