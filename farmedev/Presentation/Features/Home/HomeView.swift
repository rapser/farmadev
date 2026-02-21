//
//  HomeView.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel = HomeViewModel()) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        Group {
            if viewModel.isLoading, viewModel.dashboardItems.isEmpty {
                LoadingView()
            } else {
                content
            }
        }
        .navigationTitle("Inicio")
        .task { await viewModel.load() }
        .refreshable { await viewModel.load() }
    }

    private var content: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                if let sliderBanner = viewModel.sliderBanner, !sliderBanner.banners.isEmpty {
                    sliderSection(sliderBanner)
                }
                if !viewModel.sliderCategories.isEmpty {
                    categoriesSection
                }
                dashboardSection
            }
            .padding()
        }
    }

    private func sliderSection(_ slider: SliderBannerUI) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            TabView {
                ForEach(slider.banners) { banner in
                    AsyncImage(url: URL(string: banner.imageUrl)) { phase in
                        switch phase {
                        case .success(let image): image.resizable().scaledToFill()
                        case .failure: Color.gray.opacity(0.3)
                        default: ProgressView()
                        }
                    }
                    .frame(height: 160)
                    .clipped()
                    .cornerRadius(12)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .frame(height: 160)
        }
    }

    private var categoriesSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Categorías")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(viewModel.sliderCategories) { cat in
                        VStack(spacing: 6) {
                            AsyncImage(url: URL(string: cat.iconUrl)) { phase in
                                switch phase {
                                case .success(let image): image.resizable().scaledToFill()
                                case .failure: Color.gray.opacity(0.3)
                                default: ProgressView()
                                }
                            }
                            .frame(width: 64, height: 64)
                            .clipped()
                            .cornerRadius(8)
                            Text(cat.title)
                                .font(.caption)
                                .lineLimit(1)
                        }
                        .frame(width: 80)
                    }
                }
            }
        }
    }

    private var dashboardSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(viewModel.dashboardItems) { item in
                dashboardItemView(item)
            }
        }
    }

    private func dashboardItemView(_ item: DashboardItemUI) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            switch item.content {
            case .banner(let banner):
                AsyncImage(url: URL(string: banner.imageUrl)) { phase in
                    switch phase {
                    case .success(let image): image.resizable().scaledToFill()
                    case .failure: Color.gray.opacity(0.3)
                    default: ProgressView()
                    }
                }
                .frame(height: 120)
                .clipped()
                .cornerRadius(12)
                if !banner.title.isEmpty {
                    Text(banner.title).font(.subheadline)
                }
            case .list(let list):
                if !list.title.isEmpty {
                    Text(list.title).font(.headline)
                }
                if !list.products.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(list.products) { pack in
                                productCard(pack)
                            }
                        }
                    }
                }
            default:
                EmptyView()
            }
        }
    }

    @ViewBuilder
    private func productCard(_ pack: ProductPackUI) -> some View {
        if let product = pack.product {
            VStack(alignment: .leading, spacing: 4) {
                AsyncImage(url: URL(string: product.imageUrl)) { phase in
                    switch phase {
                    case .success(let image): image.resizable().scaledToFill()
                    case .failure: Color.gray.opacity(0.3)
                    default: ProgressView()
                    }
                }
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(8)
                Text(product.name).font(.caption).lineLimit(2)
                Text(product.price).font(.caption2)
            }
            .frame(width: 110)
        }
    }
}

#Preview {
    NavigationStack {
        HomeView(viewModel: HomeViewModel())
    }
}
