//
//  InicioView.swift
//  farmedev
//

import SwiftUI

struct InicioView: View {
    @Environment(InicioCoordinator.self) private var coordinator
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
            InicioBannerCarousel(banners: viewModel.banners)
            InicioMonederoSection()
            InicioCatalogSection(
                categories: viewModel.categories,
                onTapCategory: { category in
                    coordinator.showProductGrid(title: category.name, categoryId: category.id, search: nil)
                },
                onShowAll: {
                    coordinator.showProductGrid(title: "Catálogo", categoryId: nil, search: nil)
                }
            )
            InicioProductBannerCarousel(products: viewModel.featuredProducts) { product in
                coordinator.showProductDetail(id: product.id)
            }
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
    InicioCoordinatorView(coordinator: InicioCoordinator())
        .environment(AppState())
}
