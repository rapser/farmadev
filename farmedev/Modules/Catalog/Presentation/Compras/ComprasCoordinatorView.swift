//
//  ComprasCoordinatorView.swift
//  farmedev
//

import SwiftUI

struct ComprasCoordinatorView: View {
    @Bindable var coordinator: ComprasCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ComprasView()
                .navigationDestination(for: ComprasRoute.self) { route in
                    switch route {
                    case .productDetail(let id):
                        ProductDetailView(productId: id, onAddToCart: { product, quantity in
                            CartQuickAdd.add(product.summary, quantity: quantity)
                        })
                    case .productGrid(let title, let categoryId, let search):
                        ProductGridView(title: title, categoryId: categoryId, search: search) { product in
                            coordinator.showProductDetail(id: product.id)
                        }
                    }
                }
        }
        .environment(coordinator)
    }
}
