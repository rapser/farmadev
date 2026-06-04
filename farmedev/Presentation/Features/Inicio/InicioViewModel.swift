//
//  InicioViewModel.swift
//  farmedev
//

import Foundation

@Observable
final class InicioViewModel {
    var isLoading = false
    private let productUseCase: ProductUseCase

    init(productUseCase: ProductUseCase? = nil) {
        if let uc = productUseCase {
            self.productUseCase = uc
        } else {
            let repo = ProductDataRepository(
                productDataStoreFactory: ProductDataStoreFactory.shared,
                sessionDataStoreFactory: SessionDataStoreFactory.shared
            )
            self.productUseCase = ProductUseCase(productRepository: repo)
        }
    }

    @MainActor
    func load() async {
        isLoading = true
        defer { isLoading = false }
        _ = try? await productUseCase.getDashboard()
        _ = try? await productUseCase.getSliderBanners()
        _ = try? await productUseCase.getSliderCategory()
    }
}
