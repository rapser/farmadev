//
//  HomeDashboardSection.swift
//  farmedev
//

import SwiftUI

struct HomeDashboardSection: View {
    let items: [DashboardItemUI]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(items) { item in dashboardItem(item) }
        }
    }

    @ViewBuilder
    private func dashboardItem(_ item: DashboardItemUI) -> some View {
        switch item.content {
        case .banner(let banner):
            VStack(alignment: .leading, spacing: 8) {
                AsyncImage(url: URL(string: banner.imageUrl)) { phase in
                    switch phase {
                    case .success(let img): img.resizable().scaledToFill()
                    case .failure:          Color.gray.opacity(0.3)
                    default:                ProgressView()
                    }
                }
                .frame(height: 120).clipped().cornerRadius(12)
                if !banner.title.isEmpty { Text(banner.title).font(.subheadline) }
            }
        case .list(let list):
            VStack(alignment: .leading, spacing: 8) {
                if !list.title.isEmpty { Text(list.title).font(.headline) }
                if !list.products.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(list.products) { pack in HomeProductCard(pack: pack) }
                        }
                    }
                }
            }
        default:
            EmptyView()
        }
    }
}

struct HomeProductCard: View {
    let pack: ProductPackUI

    var body: some View {
        if let product = pack.product {
            VStack(alignment: .leading, spacing: 4) {
                AsyncImage(url: URL(string: product.imageUrl)) { phase in
                    switch phase {
                    case .success(let img): img.resizable().scaledToFill()
                    case .failure:          Color.gray.opacity(0.3)
                    default:                ProgressView()
                    }
                }
                .frame(width: 100, height: 100).clipped().cornerRadius(8)
                Text(product.name).font(.caption).lineLimit(2)
                Text(product.price).font(.caption2)
            }
            .frame(width: 110)
        }
    }
}
