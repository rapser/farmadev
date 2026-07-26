//
//  InicioProductBannerCarousel.swift
//  farmedev
//

import SwiftUI
internal import Combine

struct InicioProductBannerCarousel: View {
    let products: [StoreProductUI]
    var onTapProduct: (StoreProductUI) -> Void = { _ in }

    @State private var page: Int = 0
    private let purple = Color(red: 0.4, green: 0.2, blue: 0.6)

    var body: some View {
        if products.isEmpty {
            EmptyView()
        } else {
            VStack(spacing: 10) {
                TabView(selection: $page) {
                    ForEach(Array(products.enumerated()), id: \.element.id) { index, product in
                        productSlide(product).tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 155)
                .cornerRadius(16)
                .onReceive(Timer.publish(every: 5, on: .main, in: .common).autoconnect()) { _ in
                    guard products.count > 1 else { return }
                    withAnimation(.easeInOut(duration: 0.4)) { page = (page + 1) % products.count }
                }

                if products.count > 1 {
                    HStack(spacing: 6) {
                        ForEach(0..<products.count, id: \.self) { i in
                            Circle()
                                .fill(i == page ? purple : Color(.systemGray4))
                                .frame(width: 7, height: 7)
                                .animation(.easeInOut(duration: 0.25), value: page)
                        }
                    }
                }
            }
        }
    }

    private func productSlide(_ product: StoreProductUI) -> some View {
        Button(action: { onTapProduct(product) }) {
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("¡Destacado!")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(Color.loginHeaderOrange))

                    Text(product.name)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(Color(red: 0.12, green: 0.12, blue: 0.28))
                        .lineLimit(3)
                        .fixedSize(horizontal: false, vertical: true)

                    Text(product.priceLabel)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(Color(red: 0.12, green: 0.12, blue: 0.28))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(0.85)))
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)

                AsyncImage(url: URL(string: product.imageUrl)) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable().scaledToFit()
                    default:
                        Image(systemName: "cross.vial.fill")
                            .font(.system(size: 38))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                }
                .frame(width: 90, height: 90)
                .padding(.trailing, 12)
            }
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity, minHeight: 155)
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(red: 0.82, green: 0.90, blue: 0.95)))
    }
}
