//
//  CarritoSuggestedSection.swift
//  farmedev
//

import SwiftUI
internal import Combine

struct CarritoSuggestedSection: View {
    let products: [StoreProductUI]
    var onAdd: (StoreProductUI) -> Void = { _ in }

    @State private var currentPage: Int = 0

    private var pageCount: Int { max(1, (products.count + 1) / 2) }

    var body: some View {
        if products.isEmpty {
            EmptyView()
        } else {
            HStack(spacing: 0) {
                Rectangle().fill(Color.loginHeaderOrange).frame(width: 4)

                VStack(alignment: .leading, spacing: 12) {
                    Text("¿No olvidas nada? 👀")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.primary)

                    TabView(selection: $currentPage) {
                        ForEach(0..<pageCount, id: \.self) { page in
                            HStack(spacing: 12) {
                                CarritoProductCard(product: products[page * 2], onAdd: onAdd)
                                if page * 2 + 1 < products.count {
                                    CarritoProductCard(product: products[page * 2 + 1], onAdd: onAdd)
                                }
                            }
                            .tag(page)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: 185)
                    .onReceive(Timer.publish(every: 3, on: .main, in: .common).autoconnect()) { _ in
                        guard pageCount > 1 else { return }
                        withAnimation(.easeInOut(duration: 0.4)) { currentPage = (currentPage + 1) % pageCount }
                    }

                    if pageCount > 1 {
                        HStack(spacing: 6) {
                            ForEach(0..<pageCount, id: \.self) { i in
                                Circle()
                                    .fill(i == currentPage ? Color.loginHeaderOrange : Color(.systemGray4))
                                    .frame(width: 7, height: 7)
                                    .animation(.easeInOut(duration: 0.25), value: currentPage)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding(16)
            }
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
            .clipped()
        }
    }
}

struct CarritoProductCard: View {
    let product: StoreProductUI
    var onAdd: (StoreProductUI) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: 10).fill(Color(.systemGroupedBackground)).frame(height: 100)
                    .overlay(
                        AsyncImage(url: URL(string: product.imageUrl)) { phase in
                            switch phase {
                            case .success(let image): image.resizable().scaledToFit().padding(8)
                            default: Image(systemName: "photo").font(.system(size: 30)).foregroundStyle(Color(.systemGray4))
                            }
                        }
                    )
                Button(action: { onAdd(product) }) {
                    Circle().fill(Color.loginHeaderOrange).frame(width: 28, height: 28)
                        .overlay(Image(systemName: "plus").font(.system(size: 13, weight: .bold)).foregroundStyle(.white))
                }
                .buttonStyle(.plain).offset(x: 4, y: -4)
            }
            Text(product.name).font(.system(size: 12)).foregroundStyle(.primary).lineLimit(2).fixedSize(horizontal: false, vertical: true)
            Text(product.priceLabel).font(.system(size: 12, weight: .bold)).foregroundStyle(Color.loginHeaderOrange)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
