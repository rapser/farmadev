//
//  CuentaView.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import SwiftUI

struct CuentaView: View {
    @Environment(AppState.self) private var appState

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                profileCard
                quickActionsCard
                optionsListCard
                logoutButton
            }
            .padding(16)
            .padding(.bottom, 100)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Mi cuenta")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var profileCard: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(appState.userFullName)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.primary)
                Text(appState.userSurname)
                    .font(.system(size: 15))
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Circle()
                .fill(Color(.systemGray5))
                .frame(width: 56, height: 56)
                .overlay(
                    Image(systemName: "person.fill")
                        .font(.system(size: 28))
                        .foregroundStyle(Color(.systemGray3))
                )
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 16).fill(.white))
        .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
    }

    private var quickActionsCard: some View {
        HStack(spacing: 0) {
            quickAction(icon: "person", label: "Mi perfil")
            quickAction(icon: "shippingbox", label: "Mis pedidos")
            quickAction(icon: "heart", label: "Mis favoritos")
        }
        .padding(.vertical, 20)
        .background(RoundedRectangle(cornerRadius: 16).fill(.white))
        .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
    }

    private func quickAction(icon: String, label: String) -> some View {
        Button {} label: {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundStyle(.primary)
                Text(label)
                    .font(.system(size: 13))
                    .foregroundStyle(.primary)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
    }

    private var optionsListCard: some View {
        VStack(spacing: 0) {
            optionRow(icon: "mappin.circle", title: "Mis direcciones")
            optionRow(icon: "map", title: "Zonas de cobertura")
            optionRow(icon: "doc.text", title: "Legales")
            optionRow(icon: "doc.plaintext", title: "Políticas de privacidad")
            optionRow(icon: "doc.text", title: "Términos y condiciones")
            optionRow(icon: "building.2", title: "Retiro en botica")
            optionRow(icon: "doc.badge.gearshape", title: "Tratamiento opcional de datos")
            optionRow(icon: "headphones", title: "Atención al cliente")
            optionRow(icon: "square.and.arrow.up", title: "Compartir aplicación")
        }
        .background(RoundedRectangle(cornerRadius: 16).fill(.white))
        .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
    }

    private func optionRow(icon: String, title: String) -> some View {
        Button {} label: {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundStyle(.primary)
                    .frame(width: 28, alignment: .leading)
                Text(title)
                    .font(.system(size: 16))
                    .foregroundStyle(.primary)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(Color(.systemGray3))
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
        }
        .buttonStyle(.plain)
    }

    private var logoutButton: some View {
        Button {
            appState.logout()
        } label: {
            HStack {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.system(size: 18))
                Text("Cerrar sesión")
                    .font(.system(size: 16, weight: .medium))
            }
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
        }
        .background(RoundedRectangle(cornerRadius: 16).fill(.white))
        .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
    }
}

#Preview {
    NavigationStack {
        CuentaView()
            .environment(AppState())
    }
}
