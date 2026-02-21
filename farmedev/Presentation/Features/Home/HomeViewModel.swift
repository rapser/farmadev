//
//  HomeViewModel.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

@Observable
final class HomeViewModel {

    var dashboardItems: [DashboardItemUI] = []
    var sliderBanner: SliderBannerUI?
    var sliderCategories: [SliderCategoryUI] = []
    var isLoading = false
    var errorMessage: String?

    private let productUseCase: ProductUseCase

    init(productUseCase: ProductUseCase? = nil) {
        if let productUseCase = productUseCase {
            self.productUseCase = productUseCase
        } else {
            let productDataStoreFactory = ProductDataStoreFactory.shared
            let sessionDataStoreFactory = SessionDataStoreFactory.shared
            let repository = ProductDataRepository(
                productDataStoreFactory: productDataStoreFactory,
                sessionDataStoreFactory: sessionDataStoreFactory
            )
            self.productUseCase = ProductUseCase(productRepository: repository)
        }
    }

    @MainActor
    func load() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }

        do {
            async let dashboardTask = productUseCase.getDashboard()
            async let slidersTask = productUseCase.getSliderBanners()
            async let categoriesTask = productUseCase.getSliderCategory()

            let (dashboard, sliders, categories) = try await (dashboardTask, slidersTask, categoriesTask)

            dashboardItems = dashboard.map { $0.toUI() }
            sliderBanner = sliders.toUI()
            sliderCategories = categories.map { $0.toUI() }
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
