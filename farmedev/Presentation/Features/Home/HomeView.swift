//
//  HomeView.swift
//  farmedev
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel = HomeViewModel()) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        Group {
            if viewModel.isLoading && viewModel.dashboardItems.isEmpty {
                LoadingView()
            } else {
                scrollContent
            }
        }
        .navigationTitle("Inicio")
        .task { await viewModel.load() }
        .refreshable { await viewModel.load() }
    }

    private var scrollContent: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                if let banner = viewModel.sliderBanner, !banner.banners.isEmpty {
                    HomeSliderSection(slider: banner)
                }
                if !viewModel.sliderCategories.isEmpty {
                    HomeCategoriesSection(categories: viewModel.sliderCategories)
                }
                HomeDashboardSection(items: viewModel.dashboardItems)
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack { HomeView(viewModel: HomeViewModel()) }
}
