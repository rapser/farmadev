//
//  CuentaQuickActions.swift
//  farmedev
//

import SwiftUI

struct CuentaQuickActions: View {
    var onProfile: () -> Void = {}
    var onOrders: () -> Void = {}
    var onFavorites: () -> Void = {}

    var body: some View {
        HStack(spacing: 0) {
            quickAction(icon: "person",      label: "Mi perfil",     action: onProfile)
            quickAction(icon: "shippingbox", label: "Mis pedidos",   action: onOrders)
            quickAction(icon: "heart",       label: "Mis favoritos", action: onFavorites)
        }
        .padding(.vertical, 20)
        .background(RoundedRectangle(cornerRadius: 16).fill(.white))
        .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
    }

    private func quickAction(icon: String, label: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: icon).font(.system(size: 24)).foregroundStyle(.primary)
                Text(label).font(.system(size: 13)).foregroundStyle(.primary)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
    }
}
