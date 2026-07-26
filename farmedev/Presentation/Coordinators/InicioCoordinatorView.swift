//
//  InicioCoordinatorView.swift
//  farmedev
//

import SwiftUI

struct InicioCoordinatorView: View {
    @Bindable var coordinator: InicioCoordinator
    @State private var checkoutViewModel = CheckoutViewModel()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            InicioView()
                .navigationDestination(for: InicioRoute.self) { route in
                    switch route {
                    case .addressSearch:
                        AddressSearchView()
                    case .carrito:
                        CarritoView()
                    case .productDetail(let id):
                        ProductDetailView(productId: id, onAddToCart: { product, quantity in
                            CartQuickAdd.add(product.summary, quantity: quantity)
                        })
                    case .productGrid(let title, let categoryId, let search):
                        ProductGridView(title: title, categoryId: categoryId, search: search) { product in
                            coordinator.showProductDetail(id: product.id)
                        }
                    case .checkoutAddress:
                        AddressPickerView()
                    case .checkoutPayment:
                        CheckoutPaymentView()
                    case .checkoutSummary:
                        CheckoutSummaryView()
                    case .orderConfirmation(let orderId):
                        OrderConfirmationView(orderId: orderId)
                    }
                }
        }
        .environment(coordinator)
        .environment(checkoutViewModel)
    }
}
