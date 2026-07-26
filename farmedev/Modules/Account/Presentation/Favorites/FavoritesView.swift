//
//  FavoritesView.swift
//  farmedev
//

import SwiftUI

struct FavoritesView: View {
    @State private var viewModel = FavoritesViewModel()
    var onTapProduct: (StoreProductUI) -> Void = { _ in }

    private let columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]

    var body: some View {
        ScrollView {
            if viewModel.products.isEmpty && !viewModel.isLoading {
                Text("Aún no tienes favoritos.")
                    .foregroundStyle(.secondary)
                    .padding(.top, 60)
            } else {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.products) { product in
                        Button(action: { onTapProduct(product) }) {
                            VStack(alignment: .leading, spacing: 6) {
                                AsyncImage(url: URL(string: product.imageUrl)) { phase in
                                    switch phase {
                                    case .success(let image): image.resizable().scaledToFit()
                                    default: Color(.systemGray5)
                                    }
                                }
                                .frame(height: 100)
                                .frame(maxWidth: .infinity)
                                .background(Color.white)

                                Text(product.name).font(.system(size: 13)).lineLimit(2)
                                Text(product.priceLabel).font(.system(size: 13, weight: .bold)).foregroundStyle(Color.loginHeaderOrange)
                            }
                            .padding(8)
                            .background(RoundedRectangle(cornerRadius: 12).fill(.white))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(16)
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Mis favoritos")
        .navigationBarTitleDisplayMode(.inline)
        .task { await viewModel.load() }
        .refreshable { await viewModel.load() }
    }
}
