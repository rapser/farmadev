//
//  InicioAddressBar.swift
//  farmedev
//

import SwiftUI

struct InicioAddressBar: View {
    @Environment(AppState.self) private var appState
    @Environment(InicioCoordinator.self) private var coordinator

    var body: some View {
        HStack(spacing: 12) {
            Button(action: { coordinator.showAddressSearch() }) {
                HStack(spacing: 8) {
                    Image(systemName: "mappin.circle.fill")
                        .font(.system(size: 15))
                        .foregroundStyle(.white.opacity(0.9))
                    Text(appState.defaultAddress)
                        .font(.system(size: 12))
                        .foregroundStyle(.white)
                        .lineLimit(1)
                    Spacer()
                    Text("Delivery")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundStyle(Color.loginHeaderOrange)
                        .padding(.horizontal, 9)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(.white))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 7)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.18)))
            }
            .buttonStyle(.plain)

            Button(action: { coordinator.showCarrito() }) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "cart.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                    Text("\(appState.cartCount)")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(width: 16, height: 16)
                        .background(Circle().fill(.red.opacity(appState.cartCount > 0 ? 1 : 0.8)))
                        .offset(x: 8, y: -6)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 7)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.18)))
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
        .padding(.bottom, 10)
        .background(Color.loginHeaderOrange.ignoresSafeArea(edges: .top))
    }
}
