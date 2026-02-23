//
//  ComprasView.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import SwiftUI

struct ComprasView: View {
    @Environment(AppState.self) private var appState
    @State private var searchText: String = ""
    @State private var selectedBannerIndex: Int = 0

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                headerSection
                contentSection
            }
        }
        .background(Color(.systemGroupedBackground))
        .safeAreaInset(edge: .top, spacing: 0) {
            stickyAddressBar
        }
        .navigationBarHidden(true)
    }

    // MARK: - Sticky navigation bar (address + cart, always visible)

    private var stickyAddressBar: some View {
        HStack(spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "mappin.circle.fill")
                    .font(.system(size: 15))
                    .foregroundStyle(.white.opacity(0.9))
                Text(appState.defaultAddress)
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
                    .lineLimit(1)
                Spacer()
                Button {} label: {
                    Text("Delivery")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundStyle(Color.loginHeaderOrange)
                        .padding(.horizontal, 9)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(.white))
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 7)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.18)))

            ZStack(alignment: .topTrailing) {
                Image(systemName: "cart.fill")
                    .font(.system(size: 22))
                    .foregroundStyle(.white)
                Text("\(appState.cartCount)")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(width: 16, height: 16)
                    .background(Circle().fill(appState.cartCount > 0 ? .red : .red.opacity(0.8)))
                    .offset(x: 10, y: -8)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
        .padding(.bottom, 10)
        .background(
            Color.loginHeaderOrange
                .ignoresSafeArea(edges: .top)
        )
    }

    // MARK: - Orange scrollable header (search + curve)

    private var headerSection: some View {
        ZStack(alignment: .bottom) {
            Color.loginHeaderOrange

            OrangeHeaderCurve(height: 55)
                .fill(Color.loginHeaderOrange)
                .frame(height: 55)
                .offset(y: 1)

            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color(.systemGray))
                TextField("¿Qué buscaremos hoy?", text: $searchText)
                    .foregroundStyle(.primary)
            }
            .font(.system(size: 16))
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(RoundedRectangle(cornerRadius: 14).fill(.white))
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 20)
        }
    }

    // MARK: - Content

    private var contentSection: some View {
        VStack(spacing: 20) {
            categoryChips
            mainBannerCarousel
            productRowSection(title: "Ofertas del día")
            productRowSection(title: "Lo más vendido")
            legalDisclaimer
            countdownBanner
        }
        .padding(.horizontal, 16)
        .padding(.top, 52)
        .padding(.bottom, 100)
    }

    // MARK: - Category chips

    private var categoryChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                chip("Mifarma Prime")
                chip("Zona Depor", icon: "cup.and.saucer.fill")
                chip("Cuidado del bebé", icon: "figure.and.child.holdinghands")
                chip("Rutina", icon: "repeat")
            }
            .padding(.vertical, 4)
        }
    }

    private func chip(_ title: String, icon: String? = nil) -> some View {
        HStack(spacing: 6) {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.system(size: 14))
                    .foregroundStyle(Color.loginHeaderOrange)
            }
            Text(title)
                .font(.system(size: 14))
                .foregroundStyle(.primary)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
        )
    }

    // MARK: - Main banner carousel

    private var mainBannerCarousel: some View {
        VStack(spacing: 10) {
            TabView(selection: $selectedBannerIndex) {
                ForEach(0..<5, id: \.self) { index in
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.systemGray5))
                        VStack(spacing: 8) {
                            Image(systemName: "photo")
                                .font(.system(size: 44))
                                .foregroundStyle(Color(.systemGray3))
                            Text("Banner \(index + 1)")
                                .font(.system(size: 12))
                                .foregroundStyle(Color(.systemGray3))
                        }
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 16))

            HStack(spacing: 6) {
                ForEach(0..<5, id: \.self) { i in
                    Circle()
                        .fill(i == selectedBannerIndex
                              ? Color(red: 0.4, green: 0.2, blue: 0.6)
                              : Color(.systemGray4))
                        .frame(width: 6, height: 6)
                }
            }
        }
    }

    // MARK: - Product row sections

    private func productRowSection(title: String) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.primary)
                Spacer()
                Button("Ver todos") {}
                    .font(.system(size: 14))
                    .foregroundStyle(Color(red: 0.4, green: 0.2, blue: 0.6))
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<6, id: \.self) { i in
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.white)
                                .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
                            VStack(spacing: 6) {
                                Image(systemName: "photo")
                                    .font(.system(size: 28))
                                    .foregroundStyle(Color(.systemGray4))
                                Text("Producto \(i + 1)")
                                    .font(.system(size: 10))
                                    .foregroundStyle(Color(.systemGray4))
                            }
                        }
                        .frame(width: 110, height: 130)
                    }
                }
            }
        }
    }

    // MARK: - Legal + Countdown

    private var legalDisclaimer: some View {
        Text("Todos los productos farmacéuticos y dispositivos médicos son distribuidos por Inretail Pharma S.A. (Ley 32033)")
            .font(.system(size: 11))
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
            .padding(.vertical, 8)
    }

    private var countdownBanner: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: "alarm.fill")
                .font(.system(size: 36))
                .foregroundStyle(.red)
            Text("¡Aprovecha los mejores descuentos!")
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(.white)
                .multilineTextAlignment(.leading)
            Spacer()
            VStack(spacing: 6) {
                countdownBox("10", unit: "HORAS")
                countdownBox("06", unit: "MINUTOS")
                countdownBox("35", unit: "SEGUNDOS")
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: [Color.loginHeaderOrange, Color.loginHeaderOrange.opacity(0.85)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
    }

    private func countdownBox(_ value: String, unit: String) -> some View {
        VStack(spacing: 2) {
            Text(value)
                .font(.system(size: 16, weight: .bold))
            Text(unit)
                .font(.system(size: 9))
        }
        .foregroundStyle(.white)
        .frame(width: 64, height: 48)
        .background(RoundedRectangle(cornerRadius: 8).fill(.black.opacity(0.35)))
    }
}

#Preview {
    ComprasView()
        .environment(AppState())
}
