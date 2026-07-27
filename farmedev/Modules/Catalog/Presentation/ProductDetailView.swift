//
//  ProductDetailView.swift
//  farmedev
//
//  Shared screen reached from Inicio, Compras, and Favorites.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(AppState.self) private var appState
    @State private var viewModel: ProductDetailViewModel
    @State private var quantity = 1
    @State private var addedToCart = false

    /// Injected rather than calling Modules/Cart directly, so this shared Catalog screen
    /// doesn't need to depend on the Cart module at compile time.
    var onAddToCart: (StoreProductUI, Int) -> Void

    init(productId: String, onAddToCart: @escaping (StoreProductUI, Int) -> Void = { _, _ in }) {
        _viewModel = State(initialValue: ProductDetailViewModel(productId: productId))
        self.onAddToCart = onAddToCart
    }

    var body: some View {
        ScrollView {
            if let product = viewModel.product {
                content(for: product)
            } else if viewModel.isLoading {
                ProgressView().padding(.top, 80)
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage).foregroundStyle(.secondary).padding(.top, 80)
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(viewModel.product?.name ?? "Producto")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    appState.requireAuth {
                        Task { await viewModel.toggleFavorite() }
                    }
                } label: {
                    Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(viewModel.isFavorite ? .red : .primary)
                }
            }
        }
        .task { await viewModel.load() }
    }

    private func content(for product: StoreProductUI) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            AsyncImage(url: URL(string: product.imageUrl)) { phase in
                switch phase {
                case .success(let image): image.resizable().scaledToFit()
                default: Color(.systemGray5)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 220, maxHeight: 220)
            .background(Color.white)

            VStack(alignment: .leading, spacing: 8) {
                if product.requiresPrescription {
                    Text("Requiere receta médica")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(Color.red))
                }

                Text(product.name)
                    .font(.system(size: 20, weight: .bold))

                Text(product.priceLabel)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(Color.loginHeaderOrange)

                Text(product.isInStock ? "Stock disponible" : "Sin stock")
                    .font(.system(size: 13))
                    .foregroundStyle(product.isInStock ? Color.secondary : Color.red)

                Text(product.description)
                    .font(.system(size: 15))
                    .foregroundStyle(.secondary)
                    .padding(.top, 8)

                Stepper("Cantidad: \(quantity)", value: $quantity, in: 1...max(product.stock, 1))
                    .padding(.top, 8)

                Button(action: addToCart) {
                    Text(addedToCart ? "Agregado ✓" : "Agregar al carrito")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 12).fill(product.isInStock ? Color.loginHeaderOrange : Color.gray))
                }
                .disabled(!product.isInStock)
                .padding(.top, 12)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
        }
    }

    private func addToCart() {
        guard let product = viewModel.product else { return }
        onAddToCart(product, quantity)
        addedToCart = true
    }
}
