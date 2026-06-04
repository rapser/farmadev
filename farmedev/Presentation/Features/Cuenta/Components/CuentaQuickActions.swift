//
//  CuentaQuickActions.swift
//  farmedev
//

import SwiftUI

struct CuentaQuickActions: View {
    var body: some View {
        HStack(spacing: 0) {
            quickAction(icon: "person",      label: "Mi perfil")
            quickAction(icon: "shippingbox", label: "Mis pedidos")
            quickAction(icon: "heart",       label: "Mis favoritos")
        }
        .padding(.vertical, 20)
        .background(RoundedRectangle(cornerRadius: 16).fill(.white))
        .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
    }

    private func quickAction(icon: String, label: String) -> some View {
        Button {} label: {
            VStack(spacing: 8) {
                Image(systemName: icon).font(.system(size: 24)).foregroundStyle(.primary)
                Text(label).font(.system(size: 13)).foregroundStyle(.primary)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
    }
}
