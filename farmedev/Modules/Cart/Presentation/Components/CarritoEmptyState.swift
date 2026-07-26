//
//  CarritoEmptyState.swift
//  farmedev
//

import SwiftUI

struct CarritoEmptyState: View {
    @Environment(InicioCoordinator.self) private var coordinator
    let selectedTab: CarritoTab

    var body: some View {
        if selectedTab == .carrito { emptyCart } else { emptyFavorites }
    }

    private var emptyCart: some View {
        VStack(spacing: 16) {
            ZStack(alignment: .topTrailing) {
                Image(systemName: "cart")
                    .font(.system(size: 56))
                    .foregroundStyle(Color.loginLinkPurple.opacity(0.75))
                Circle().fill(Color.loginHeaderOrange).frame(width: 24, height: 24)
                    .overlay(Image(systemName: "plus").font(.system(size: 13, weight: .bold)).foregroundStyle(.white))
                    .offset(x: 6, y: -4)
            }
            .padding(.top, 28)

            VStack(spacing: 8) {
                Text("Tu carrito está vacío").font(.system(size: 17, weight: .bold)).foregroundStyle(.primary)
                Text("Una vez que añadas algo a tu carrito, aparecerá aquí.")
                    .font(.system(size: 14)).foregroundStyle(.secondary)
                    .multilineTextAlignment(.center).padding(.horizontal, 16)
            }

            Button(action: { coordinator.pop() }) {
                Text("Ir a comprar").font(.system(size: 16, weight: .bold)).foregroundStyle(.white)
                    .frame(maxWidth: .infinity).frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 14).fill(Color.loginHeaderOrange))
            }
            .buttonStyle(.plain).padding(.bottom, 24)
        }
        .padding(.horizontal, 20).frame(maxWidth: .infinity)
    }

    private var emptyFavorites: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart").font(.system(size: 56))
                .foregroundStyle(Color.loginLinkPurple.opacity(0.6)).padding(.top, 28)

            VStack(spacing: 8) {
                Text("Sin favoritos aún").font(.system(size: 17, weight: .bold)).foregroundStyle(.primary)
                Text("Guarda tus productos favoritos para encontrarlos fácilmente.")
                    .font(.system(size: 14)).foregroundStyle(.secondary)
                    .multilineTextAlignment(.center).padding(.horizontal, 16)
            }

            Button(action: { coordinator.pop() }) {
                Text("Explorar productos").font(.system(size: 16, weight: .bold)).foregroundStyle(.white)
                    .frame(maxWidth: .infinity).frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 14).fill(Color.loginHeaderOrange))
            }
            .buttonStyle(.plain).padding(.bottom, 24)
        }
        .padding(.horizontal, 20).frame(maxWidth: .infinity)
    }
}
