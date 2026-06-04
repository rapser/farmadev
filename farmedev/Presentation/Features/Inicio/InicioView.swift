//
//  InicioView.swift
//  farmedev
//

import SwiftUI

struct InicioView: View {
    @State private var viewModel = InicioViewModel()
    @State private var searchText: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                InicioHeaderView(searchText: $searchText)
                contentSection
            }
        }
        .background(Color(.systemGroupedBackground))
        .safeAreaInset(edge: .top, spacing: 0) {
            InicioAddressBar()
        }
        .navigationBarHidden(true)
        .task { await viewModel.load() }
        .refreshable { await viewModel.load() }
    }

    private var contentSection: some View {
        VStack(spacing: 20) {
            InicioSavingsCards()
            InicioBannerCarousel()
            InicioMonederoSection()
            InicioCatalogSection()
            InicioProductBannerCarousel()
            monederoInfoSection
        }
        .padding(.horizontal, 16)
        .padding(.top, 14)
        .padding(.bottom, 100)
    }

    private var monederoInfoSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Conoce tu Monedero del Ahorro")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.primary)
            InicioMonederoInfoCard()
        }
    }
}

#Preview {
    InicioView()
        .environment(AppState())
}
