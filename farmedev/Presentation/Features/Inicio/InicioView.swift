//
//  InicioView.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import SwiftUI

struct InicioView: View {
    @Environment(AppState.self) private var appState
    @State private var viewModel = InicioViewModel()
    @State private var searchText: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                headerSection
                whiteContentSection
            }
        }
        .background(Color(.systemGroupedBackground))
        .safeAreaInset(edge: .top, spacing: 0) {
            stickyAddressBar
        }
        .navigationBarHidden(true)
        .task { await viewModel.load() }
        .refreshable { await viewModel.load() }
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
                if appState.cartCount > 0 {
                    Text("\(appState.cartCount)")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(width: 16, height: 16)
                        .background(Circle().fill(.red))
                        .offset(x: 10, y: -8)
                } else {
                    Text("0")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(width: 16, height: 16)
                        .background(Circle().fill(.red.opacity(0.8)))
                        .offset(x: 10, y: -8)
                }
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

    // MARK: - Orange scrollable header (greeting, search, curve)

    private var headerSection: some View {
        ZStack(alignment: .bottom) {
            Color.loginHeaderOrange

            InicioHeaderCurve()
                .fill(Color.loginHeaderOrange)
                .frame(height: 65)
                .offset(y: 1)

            VStack(alignment: .leading, spacing: 12) {
                Text("Hola \(appState.userDisplayName)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)
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
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 20)
        }
    }

    // MARK: - White content (savings, coupon, monedero, catalog, promo)

    private var whiteContentSection: some View {
        VStack(spacing: 20) {
            savingsCardsRow
            couponBanner
            monederoSection
            catalogSection
            legalDisclaimer
            promoBannerWithCountdown
        }
        .padding(.horizontal, 16)
        .padding(.top, 14)
        .padding(.bottom, 100)
    }

    private var savingsCardsRow: some View {
        HStack(spacing: 12) {
            savingsCard(title: "Ahorraste", amount: "S/ 0.33", subtitle: "Últimos 12 meses", icon: "dollarsign.circle.fill")
            savingsCard(title: "Tienes", amount: "S/ 5.42", subtitle: "Equivalen a 542 pts.", icon: "centsign.circle.fill")
        }
    }

    private func savingsCard(title: String, amount: String, subtitle: String, icon: String) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundStyle(Color.loginHeaderOrange)
                Text(amount)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(Color(red: 0.4, green: 0.2, blue: 0.6))
                Text(subtitle)
                    .font(.system(size: 9, weight: .medium))
                    .foregroundStyle(.secondary)
            }
            Spacer(minLength: 0)
            Image(systemName: icon)
                .font(.system(size: 32))
                .foregroundStyle(Color.loginHeaderOrange.opacity(0.5))
        }
        .padding(.top, 16)
        .padding(.leading, 16)
        .padding(.bottom, 16)
        .padding(.trailing, 0)
        .background(RoundedRectangle(cornerRadius: 16).fill(.white))
        .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
    }

    private var couponBanner: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Encuentra tus")
                    .font(.system(size: 14))
                    .foregroundStyle(.white)
                HStack(spacing: 4) {
                    Text("CUPONES")
                        .font(.system(size: 18, weight: .bold))
                    Text("de")
                        .font(.system(size: 12))
                    Text("DESCUENTO")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(Color.loginHeaderOrange)
                }
                .foregroundStyle(.white)
            }
            Spacer()
            Button {} label: {
                Text("Aquí")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(Color(red: 0.1, green: 0.1, blue: 0.35))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Capsule().fill(.white))
            }
            .buttonStyle(.plain)
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(red: 0.1, green: 0.1, blue: 0.35)))
        .overlay(
            HStack(spacing: 4) {
                Circle().fill(Color(.systemGray4)).frame(width: 6, height: 6)
                Circle().fill(Color(red: 0.4, green: 0.2, blue: 0.6)).frame(width: 6, height: 6)
            }
            .offset(y: 28)
        )
    }

    private var monederoSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Monedero del Ahorro")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.primary)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    monederoAction(icon: "square.grid.2x2", label: "Ver todo", borderColor: Color(red: 0.4, green: 0.2, blue: 0.6))
                    monederoAction(icon: "star.circle", label: "Juega a la ruleta", bgColor: Color(red: 0.4, green: 0.2, blue: 0.6))
                    monederoAction(icon: "percent", label: "Tienes 15 cupones", bgColor: Color(red: 0.2, green: 0.4, blue: 0.8))
                    monederoAction(icon: "mappin.circle", label: "Consulta de stock", bgColor: Color(red: 0.2, green: 0.6, blue: 0.7))
                }
            }
        }
    }

    private func monederoAction(icon: String, label: String, borderColor: Color? = nil, bgColor: Color? = nil) -> some View {
        VStack(spacing: 8) {
            ZStack {
                if let bg = bgColor {
                    Circle().fill(bg).frame(width: 56, height: 56)
                } else {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(borderColor ?? .clear, lineWidth: 2)
                        .frame(width: 56, height: 56)
                }
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundStyle(.white)
            }
            Text(label)
                .font(.system(size: 11))
                .foregroundStyle(.primary)
                .lineLimit(1)
                .multilineTextAlignment(.center)
        }
        .frame(width: 80)
    }

    private var catalogSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Catálogo de productos")
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
                Button("Mostrar todos") {}
                    .font(.system(size: 14))
                    .foregroundStyle(Color(red: 0.4, green: 0.2, blue: 0.6))
            }
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                catalogItem(title: "Beauty & Care", icon: "paintbrush.fill")
                catalogItem(title: "Cuidado Personal", icon: "drop.fill")
                catalogItem(title: "Wellness", icon: "heart.fill")
                catalogItem(title: "Cuidado del Bebé", icon: "figure.and.child.holdinghands")
                catalogItem(title: "Farmacia", icon: "cross.case.fill")
            }
        }
    }

    private func catalogItem(title: String, icon: String) -> some View {
        VStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .frame(height: 80)
                .overlay(
                    Image(systemName: icon)
                        .font(.system(size: 32))
                        .foregroundStyle(Color.loginHeaderOrange.opacity(0.7))
                )
                .shadow(color: .black.opacity(0.04), radius: 4)
            Text(title)
                .font(.system(size: 11))
                .foregroundStyle(.primary)
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
    }

    private var legalDisclaimer: some View {
        Text("Todos los productos farmacéuticos y dispositivos médicos son distribuidos por Inretail Pharma S.A. (Ley 32033)")
            .font(.system(size: 11))
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
            .padding(.vertical, 8)
    }

    private var promoBannerWithCountdown: some View {
        HStack {
            Image(systemName: "alarm.fill")
                .font(.system(size: 32))
                .foregroundStyle(.red)
            Text("¡Aprovecha los mejores descuentos!")
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(.white)
            Spacer()
            HStack(spacing: 6) {
                countdownBox("10", unit: "HORAS")
                countdownBox("06", unit: "MIN")
                countdownBox("35", unit: "SEG")
            }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.loginHeaderOrange))
    }

    private func countdownBox(_ value: String, unit: String) -> some View {
        VStack(spacing: 2) {
            Text(value)
                .font(.system(size: 14, weight: .bold))
            Text(unit)
                .font(.system(size: 9))
        }
        .foregroundStyle(.white)
        .frame(width: 52, height: 44)
        .background(RoundedRectangle(cornerRadius: 8).fill(.black.opacity(0.3)))
    }
}


struct InicioHeaderCurve: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: h))
        path.addQuadCurve(to: CGPoint(x: w, y: h), control: CGPoint(x: w / 2, y: h + 140))
        path.addLine(to: CGPoint(x: w, y: 0))
        path.closeSubpath()
        return path
    }
}

@Observable
final class InicioViewModel {
    var isLoading = false
    private let productUseCase: ProductUseCase

    init(productUseCase: ProductUseCase? = nil) {
        if let uc = productUseCase {
            self.productUseCase = uc
        } else {
            let repo = ProductDataRepository(
                productDataStoreFactory: ProductDataStoreFactory.shared,
                sessionDataStoreFactory: SessionDataStoreFactory.shared
            )
            self.productUseCase = ProductUseCase(productRepository: repo)
        }
    }

    @MainActor
    func load() async {
        isLoading = true
        defer { isLoading = false }
        _ = try? await productUseCase.getDashboard()
        _ = try? await productUseCase.getSliderBanners()
        _ = try? await productUseCase.getSliderCategory()
    }
}

#Preview {
    InicioView()
        .environment(AppState())
}
