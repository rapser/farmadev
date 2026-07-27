//
//  ComprasProductRow.swift
//  farmedev
//

import SwiftUI

struct ComprasProductRow: View {
    let title: String
    let products: [StoreProductUI]
    var onTapProduct: (StoreProductUI) -> Void = { _ in }
    var onSeeAll: () -> Void = {}

    var body: some View {
        if products.isEmpty {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(title).font(.system(size: 16, weight: .semibold)).foregroundStyle(.primary)
                    Spacer()
                    Button("Ver todos", action: onSeeAll)
                        .font(.system(size: 14)).foregroundStyle(Color(red: 0.4, green: 0.2, blue: 0.6))
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(products) { product in
                            Button(action: { onTapProduct(product) }) {
                                VStack(spacing: 6) {
                                    AsyncImage(url: URL(string: product.imageUrl)) { phase in
                                        switch phase {
                                        case .success(let image): image.resizable().scaledToFit()
                                        default: Image(systemName: "photo").font(.system(size: 28)).foregroundStyle(Color(.systemGray4))
                                        }
                                    }
                                    .frame(height: 70)
                                    Text(product.name)
                                        .font(.system(size: 10))
                                        .foregroundStyle(.primary)
                                        .lineLimit(2)
                                    Text(product.priceLabel)
                                        .font(.system(size: 11, weight: .bold))
                                        .foregroundStyle(Color.loginHeaderOrange)
                                }
                                .padding(8)
                                .frame(width: 110, height: 130)
                                .background(RoundedRectangle(cornerRadius: 12).fill(.white))
                                .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
        }
    }
}
