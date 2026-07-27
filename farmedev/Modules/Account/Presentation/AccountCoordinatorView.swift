//
//  AccountCoordinatorView.swift
//  farmedev
//

import SwiftUI

struct AccountCoordinatorView: View {
    @Bindable var coordinator: AccountCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            CuentaView()
                .navigationDestination(for: AccountRoute.self) { route in
                    switch route {
                    case .profile:
                        ProfileEditView()
                    case .orders:
                        OrderHistoryView(onTapOrder: { order in coordinator.showOrderDetail(id: order.id) })
                    case .orderDetail(let id):
                        OrderDetailLoaderView(orderId: id)
                    case .favorites:
                        FavoritesView()
                    case .addresses:
                        AddressesListView()
                    }
                }
        }
        .environment(coordinator)
    }
}
