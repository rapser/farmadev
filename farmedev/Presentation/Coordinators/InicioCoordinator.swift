//
//  InicioCoordinator.swift
//  farmedev
//

import SwiftUI

enum InicioRoute: Hashable {
    case addressSearch
    case carrito
}

@Observable
final class InicioCoordinator {
    var path = NavigationPath()

    func showAddressSearch() {
        path.append(InicioRoute.addressSearch)
    }

    func showCarrito() {
        path.append(InicioRoute.carrito)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
