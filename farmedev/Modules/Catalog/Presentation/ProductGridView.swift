//
//  ProductGridView.swift
//  farmedev
//
//  Reusable paginated grid (manual "Cargar más" rather than infinite scroll — the simplest
//  correct approach), reached from category taps, search, and Favorites.
//

import SwiftUI

struct ProductGridView: View {
    let title: String
    @State private var viewModel: ProductGridViewModel
    var onTapProduct: (StoreProductUI) -> Void

    init(title: String, categoryId: String? = nil, search: String? = nil, onTapProduct: @escaping (StoreProductUI) -> Void) {
        self.title = title
        _viewModel = State(initialValue: ProductGridViewModel(categoryId: categoryId, search: search))
        self.onTapProduct = onTapProduct
    }

    private let columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]

    var body: some View {
        ScrollView {
            if viewModel.products.isEmpty && !viewModel.isLoading {
                Text("No se encontraron productos.")
                    .foregroundStyle(.secondary)
                    .padding(.top, 60)
            } else {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.products) { product in
                        productCell(product)
                            .onTapGesture { onTapProduct(product) }
                    }
                }
                .padding(16)

                if viewModel.canLoadMore {
                    Button("Cargar más") {
                        Task { await viewModel.loadNextPage() }
                    }
                    .padding(.bottom, 24)
                }
            }

            if viewModel.isLoading {
                ProgressView().padding()
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .task { await viewModel.loadFirstPage() }
    }

    private func productCell(_ product: StoreProductUI) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            AsyncImage(url: URL(string: product.imageUrl)) { phase in
                switch phase {
                case .success(let image): image.resizable().scaledToFit()
                default: Color(.systemGray5)
                }
            }
            .frame(height: 110)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))

            Text(product.name)
                .font(.system(size: 13, weight: .medium))
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(product.priceLabel)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(Color.loginHeaderOrange)
        }
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 12).fill(.white))
        .shadow(color: .black.opacity(0.04), radius: 4)
    }
}
