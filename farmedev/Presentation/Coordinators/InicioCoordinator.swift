//
//  InicioCoordinator.swift
//  farmedev
//

import SwiftUI

enum InicioRoute: Hashable {
    case addressSearch
    case carrito
    case productDetail(id: String)
    case productGrid(title: String, categoryId: String?, search: String?)
    case checkoutAddress
    case checkoutPayment
    case checkoutSummary
    case orderConfirmation(orderId: String)
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

    func showProductDetail(id: String) {
        path.append(InicioRoute.productDetail(id: id))
    }

    func showProductGrid(title: String, categoryId: String? = nil, search: String? = nil) {
        path.append(InicioRoute.productGrid(title: title, categoryId: categoryId, search: search))
    }

    func showCheckoutAddress() {
        path.append(InicioRoute.checkoutAddress)
    }

    func showCheckoutPayment() {
        path.append(InicioRoute.checkoutPayment)
    }

    func showCheckoutSummary() {
        path.append(InicioRoute.checkoutSummary)
    }

    func showOrderConfirmation(orderId: String) {
        path.append(InicioRoute.orderConfirmation(orderId: orderId))
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
