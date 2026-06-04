//
//  CarritoTabSelector.swift
//  farmedev
//

import SwiftUI

enum CarritoTab { case carrito, favoritos }

struct CarritoTabSelector: View {
    @Binding var selectedTab: CarritoTab
    private let purple = Color.loginLinkPurple

    var body: some View {
        HStack(spacing: 0) {
            tabButton(tab: .carrito,   selectedIcon: "cart.fill",  unselectedIcon: "cart",  label: "Mi carrito")
            tabButton(tab: .favoritos, selectedIcon: "heart.fill",  unselectedIcon: "heart", label: "Mis favoritos")
        }
        .background(Color(.systemBackground))
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.06), radius: 6, y: 2)
    }

    private func tabButton(tab: CarritoTab, selectedIcon: String, unselectedIcon: String, label: String) -> some View {
        let isSelected = selectedTab == tab
        return Button(action: { selectedTab = tab }) {
            HStack(spacing: 6) {
                Image(systemName: isSelected ? selectedIcon : unselectedIcon)
                    .font(.system(size: 14, weight: isSelected ? .semibold : .regular))
                Text(label).font(.system(size: 14, weight: .medium))
            }
            .foregroundStyle(purple)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(isSelected ? purple.opacity(0.12) : Color.clear)
            .cornerRadius(30)
        }
        .buttonStyle(.plain)
    }
}
