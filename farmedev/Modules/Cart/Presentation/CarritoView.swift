//
//  CarritoView.swift
//  farmedev
//

import SwiftUI

struct CarritoView: View {
    @Environment(InicioCoordinator.self) private var coordinator
    @Environment(AppState.self) private var appState
    @State private var selectedTab: CarritoTab = .carrito
    @State private var viewModel = CarritoViewModel()

    var body: some View {
        VStack(spacing: 0) {
            CarritoAddressStrip()
            Divider()

            ScrollView {
                VStack(spacing: 16) {
                    VStack(spacing: 0) {
                        CarritoTabSelector(selectedTab: $selectedTab)
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
                            .padding(.bottom, 8)

                        if selectedTab == .carrito {
                            if viewModel.cart.isEmpty {
                                CarritoEmptyState(selectedTab: selectedTab)
                            } else {
                                cartContent
                            }
                        } else {
                            CarritoEmptyState(selectedTab: selectedTab)
                        }
                    }
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
                    .padding(.top, 16)

                    CarritoSuggestedSection(products: viewModel.suggestedProducts) { product in
                        Task { await viewModel.addSuggested(product) }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 100)
            }
            .background(Color(.systemGroupedBackground))
        }
        .navigationTitle("Mi carrito")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: { coordinator.pop() }) {
                    Image(systemName: "chevron.left").font(.system(size: 18, weight: .semibold)).foregroundStyle(.primary)
                }
            }
        }
        .task { await viewModel.load() }
        .onChange(of: viewModel.cart) { _, newCart in
            appState.setCartCount(newCart.itemCount)
        }
    }

    private var cartContent: some View {
        VStack(spacing: 16) {
            CarritoItemsList(
                items: viewModel.cart.items,
                onUpdateQuantity: { productId, quantity in
                    Task { await viewModel.updateQuantity(productId: productId, quantity: quantity) }
                },
                onRemove: { productId in
                    Task { await viewModel.removeItem(productId: productId) }
                }
            )
            .padding(.horizontal, 12)

            HStack {
                Text("Subtotal").font(.system(size: 15, weight: .medium))
                Spacer()
                Text(CurrencyFormatting.soles(viewModel.cart.subtotal))
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(Color.loginHeaderOrange)
            }
            .padding(.horizontal, 12)

            Button(action: proceedToCheckout) {
                Text("Proceder al pago")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 14).fill(Color.loginHeaderOrange))
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 16)
        }
        .padding(.top, 8)
    }

    private func proceedToCheckout() {
        appState.requireAuth {
            coordinator.showCheckoutAddress()
        }
    }
}
