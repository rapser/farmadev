//
//  CuentaProfileCard.swift
//  farmedev
//

import SwiftUI

struct CuentaProfileCard: View {
    @Environment(AppState.self) private var appState

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(appState.userFullName).font(.system(size: 18, weight: .bold)).foregroundStyle(.primary)
                Text(appState.userSurname).font(.system(size: 15)).foregroundStyle(.secondary)
            }
            Spacer()
            Circle().fill(Color(.systemGray5)).frame(width: 56, height: 56)
                .overlay(Image(systemName: "person.fill").font(.system(size: 28)).foregroundStyle(Color(.systemGray3)))
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 16).fill(.white))
        .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
    }
}
