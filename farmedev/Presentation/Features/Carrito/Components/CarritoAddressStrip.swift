//
//  CarritoAddressStrip.swift
//  farmedev
//

import SwiftUI

struct CarritoAddressStrip: View {
    @Environment(AppState.self) private var appState

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "mappin.circle.fill")
                .font(.system(size: 15))
                .foregroundStyle(Color(.systemGray3))
            Text(appState.defaultAddress)
                .font(.system(size: 13))
                .foregroundStyle(.primary)
                .lineLimit(1)
            Spacer()
            Text("Delivery")
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(Color.loginLinkPurple)
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(Color(.systemGray3))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color(.systemBackground))
    }
}
