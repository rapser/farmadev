//
//  InicioCoordinatorView.swift
//  farmedev
//

import SwiftUI

struct InicioCoordinatorView: View {
    @Bindable var coordinator: InicioCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            InicioView()
                .navigationDestination(for: InicioRoute.self) { route in
                    switch route {
                    case .addressSearch:
                        AddressSearchView()
                    case .carrito:
                        CarritoView()
                    }
                }
        }
        .environment(coordinator)
    }
}
