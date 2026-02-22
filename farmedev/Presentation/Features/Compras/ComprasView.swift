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
        .overlay(alignment: .top) {
            Color.loginHeaderOrange
                .ignoresSafeArea(edges: .top)
                .frame(height: 0)
        }
        .navigationBarHidden(true)
    }

    // MARK: - Orange header (location, delivery, cart, search – no greeting)

    private var headerSection: some View {
        ZStack(alignment: .bottom) {
            Color.loginHeaderOrange
                .ignoresSafeArea(edges: .top)

            VStack(spacing: 14) {
                HStack {
                    HStack(spacing: 6) {
                        Image(systemName: "mappin.circle.fill")
                            .font(.system(size: 18))
                            .foregroundStyle(.white.opacity(0.9))
                        Text(appState.defaultAddress)
                            .font(.system(size: 13))
                            .foregroundStyle(.white)
                            .lineLimit(1)
                    }
                    Spacer()
                    Button {} label: {
                        Text("Delivery")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundStyle(Color.loginHeaderOrange)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Capsule().fill(.white))
                    }
                    .buttonStyle(.plain)
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
                    .padding(.leading, 8)
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)

                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color(.systemGray))
                    TextField("¿Qué buscaremos hoy?", text: $searchText)
                        .foregroundStyle(.primary)
                }
                .font(.system(size: 16))
                .padding(14)
                .background(RoundedRectangle(cornerRadius: 14).fill(.white))
                .padding(.horizontal, 20)
                .padding(.bottom, 18)
            }

            OrangeHeaderCurve(height: 55)
                .fill(Color.loginHeaderOrange)
                .frame(height: 55)
                .offset(y: 1)
        }
    }

    // MARK: - Content: chips, promo banner, legal, countdown banner

    private var contentSection: some View {
        VStack(spacing: 20) {
            categoryChips
            colgateProtexBanner
            legalDisclaimer
            countdownBanner
        }
        .padding(.horizontal, 16)
        .padding(.top, 52)
        .padding(.bottom, 100)
    }

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

    private var colgateProtexBanner: some View {
        VStack(spacing: 0) {
            Text("16 AL 22 DE FEBRERO")
                .font(.system(size: 11, weight: .semibold))
                .foregroundStyle(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Capsule().fill(Color(.systemGray)))
                .padding(.top, 16)
                .padding(.bottom, 12)

            HStack(alignment: .top, spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Por la compra de COLGATE LUMINOUS WHITE 2 und - Tubos de 75 ml o COLGATE TOTAL 1 und - Tubo de 150 ml")
                        .font(.system(size: 11))
                        .foregroundStyle(.white)
                        .lineLimit(4)
                    HStack(spacing: 8) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.white.opacity(0.3))
                            .frame(width: 50, height: 60)
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.white.opacity(0.3))
                            .frame(width: 50, height: 60)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .trailing, spacing: 4) {
                    HStack(spacing: 4) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 20))
                            .foregroundStyle(Color.mifarmaGreen)
                        Text("S/ 5.00")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.white)
                    }
                    Text("Llévate")
                        .font(.system(size: 12))
                        .foregroundStyle(.white.opacity(0.9))
                    Text("Tripack de jabones PROTEX")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(.white)
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.white.opacity(0.3))
                        .frame(width: 56, height: 50)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 8)

            Text("Válido según términos y condiciones. Stock sujeto a disponibilidad.")
                .font(.system(size: 9))
                .foregroundStyle(.white.opacity(0.8))
                .padding(.horizontal, 16)
                .padding(.bottom, 12)

            HStack(spacing: 6) {
                ForEach(0..<5, id: \.self) { i in
                    Circle()
                        .fill(i == selectedBannerIndex ? Color(red: 0.4, green: 0.2, blue: 0.6) : Color(.systemGray4))
                        .frame(width: 6, height: 6)
                }
            }
            .padding(.bottom, 16)
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.loginHeaderOrange)
                .shadow(color: .black.opacity(0.08), radius: 8, y: 4)
        )
    }

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
