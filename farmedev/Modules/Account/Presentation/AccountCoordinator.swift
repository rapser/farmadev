//
//  AccountCoordinator.swift
//  farmedev
//

import SwiftUI

enum AccountRoute: Hashable {
    case profile
    case orders
    case orderDetail(id: String)
    case favorites
    case addresses
}

@Observable
final class AccountCoordinator {
    var path = NavigationPath()

    func showProfile() { path.append(AccountRoute.profile) }
    func showOrders() { path.append(AccountRoute.orders) }
    func showOrderDetail(id: String) { path.append(AccountRoute.orderDetail(id: id)) }
    func showFavorites() { path.append(AccountRoute.favorites) }
    func showAddresses() { path.append(AccountRoute.addresses) }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
