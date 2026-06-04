//
//  HomeCategoriesSection.swift
//  farmedev
//

import SwiftUI

struct HomeCategoriesSection: View {
    let categories: [SliderCategoryUI]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Categorías").font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(categories) { cat in
                        VStack(spacing: 6) {
                            AsyncImage(url: URL(string: cat.iconUrl)) { phase in
                                switch phase {
                                case .success(let img): img.resizable().scaledToFill()
                                case .failure:          Color.gray.opacity(0.3)
                                default:                ProgressView()
                                }
                            }
                            .frame(width: 64, height: 64).clipped().cornerRadius(8)
                            Text(cat.title).font(.caption).lineLimit(1)
                        }
                        .frame(width: 80)
                    }
                }
            }
        }
    }
}
