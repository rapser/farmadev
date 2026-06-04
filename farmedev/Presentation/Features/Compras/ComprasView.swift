//
//  ComprasView.swift
//  farmedev
//

import SwiftUI

struct ComprasView: View {
    @State private var searchText: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ComprasHeaderView(searchText: $searchText)
                contentSection
            }
        }
        .background(Color(.systemGroupedBackground))
        .safeAreaInset(edge: .top, spacing: 0) { ComprasAddressBar() }
        .navigationBarHidden(true)
    }

    private var contentSection: some View {
        VStack(spacing: 20) {
            ComprasCategoryChips()
            ComprasBannerCarousel()
            ComprasProductRow(title: "Ofertas del día")
            ComprasProductRow(title: "Lo más vendido")
            legalDisclaimer
            ComprasCountdownBanner()
        }
        .padding(.horizontal, 16)
        .padding(.top, 52)
        .padding(.bottom, 100)
    }

    private var legalDisclaimer: some View {
        Text("Todos los productos farmacéuticos y dispositivos médicos son distribuidos por Inretail Pharma S.A. (Ley 32033)")
            .font(.system(size: 11)).foregroundStyle(.secondary)
            .multilineTextAlignment(.center).padding(.vertical, 8)
    }
}

#Preview {
    ComprasView().environment(AppState())
}
