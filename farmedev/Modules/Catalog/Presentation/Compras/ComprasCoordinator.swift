//
//  ComprasCoordinator.swift
//  farmedev
//

import SwiftUI

enum ComprasRoute: Hashable {
    case productDetail(id: String)
    case productGrid(title: String, categoryId: String?, search: String?)
}

@Observable
final class ComprasCoordinator {
    var path = NavigationPath()

    func showProductDetail(id: String) {
        path.append(ComprasRoute.productDetail(id: id))
    }

    func showProductGrid(title: String, categoryId: String? = nil, search: String? = nil) {
        path.append(ComprasRoute.productGrid(title: title, categoryId: categoryId, search: search))
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
