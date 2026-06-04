//
//  MockoonResponses.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//
//  DTOs matching Mockoon API response shapes (dashboard/2, dashboard/v2/sliders, dashboard/categoryOutstanding).
//

import Foundation

// MARK: - Dashboard (GET dashboard/2)

struct MockoonDashboardItemDTO: Codable {
    let id: Int?
    let type: String?
    let title: String?
    let imageUrl: String?
    let actionUrl: String?
    let products: [MockoonDashboardProductDTO]?
}

struct MockoonDashboardProductDTO: Codable {
    let id: String?
    let name: String?
    let price: Double?
    let imageList: [MockoonImageItemDTO]?
}

struct MockoonImageItemDTO: Codable {
    let url: String?
}

// MARK: - Sliders (GET dashboard/v2/sliders)

struct MockoonSlidersResponseDTO: Codable {
    let sliders: [MockoonSliderItemDTO]?
}

struct MockoonSliderItemDTO: Codable {
    let id: Int?
    let imageUrl: String?
    let actionUrl: String?
    let order: Int?
}

// MARK: - Slider categories (GET dashboard/categoryOutstanding)

struct MockoonSliderCategoryItemDTO: Codable {
    let id: Int?
    let name: String?
    let imageUrl: String?
}
