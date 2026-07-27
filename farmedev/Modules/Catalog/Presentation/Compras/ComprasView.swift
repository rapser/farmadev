//
//  ComprasView.swift
//  farmedev
//

import SwiftUI

struct ComprasView: View {
    @Environment(ComprasCoordinator.self) private var coordinator
    @State private var viewModel = ComprasViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ComprasHeaderView(searchText: Binding(get: { viewModel.searchText }, set: { viewModel.searchText = $0 }))
                contentSection
            }
        }
        .background(Color(.systemGroupedBackground))
        .safeAreaInset(edge: .top, spacing: 0) { ComprasAddressBar() }
        .navigationBarHidden(true)
        .task { await viewModel.load() }
        .refreshable { await viewModel.load() }
    }

    @ViewBuilder
    private var contentSection: some View {
        if !viewModel.searchText.trimmingCharacters(in: .whitespaces).isEmpty {
            searchResultsSection
        } else {
            browseSection
        }
    }

    private var searchResultsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            if viewModel.searchResults.isEmpty && !viewModel.isSearching {
                Text("No se encontraron productos para \"\(viewModel.searchText)\"")
                    .foregroundStyle(.secondary)
                    .padding(.top, 24)
            } else {
                ForEach(viewModel.searchResults) { product in
                    Button {
                        coordinator.showProductDetail(id: product.id)
                    } label: {
                        HStack {
                            Text(product.name).foregroundStyle(.primary)
                            Spacer()
                            Text(product.priceLabel).foregroundStyle(Color.loginHeaderOrange)
                        }
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 52)
    }

    private var browseSection: some View {
        VStack(spacing: 20) {
            ComprasCategoryChips(categories: viewModel.categories) { category in
                coordinator.showProductGrid(title: category.name, categoryId: category.id, search: nil)
            }
            ComprasBannerCarousel(banners: viewModel.banners)
            ComprasProductRow(title: "Ofertas del día", products: viewModel.offerProducts) { product in
                coordinator.showProductDetail(id: product.id)
            } onSeeAll: {
                coordinator.showProductGrid(title: "Ofertas del día", categoryId: nil, search: nil)
            }
            ComprasProductRow(title: "Lo más vendido", products: viewModel.bestSellingProducts) { product in
                coordinator.showProductDetail(id: product.id)
            } onSeeAll: {
                coordinator.showProductGrid(title: "Lo más vendido", categoryId: nil, search: nil)
            }
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
    ComprasCoordinatorView(coordinator: ComprasCoordinator())
        .environment(AppState())
}
