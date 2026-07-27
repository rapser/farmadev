//
//  ComprasBannerCarousel.swift
//  farmedev
//

import SwiftUI
internal import Combine

struct ComprasBannerCarousel: View {
    let banners: [StoreBannerUI]

    @State private var page: Int = 0
    private let purple = Color(red: 0.4, green: 0.2, blue: 0.6)

    var body: some View {
        if banners.isEmpty {
            EmptyView()
        } else {
            VStack(spacing: 10) {
                TabView(selection: $page) {
                    ForEach(Array(banners.enumerated()), id: \.element.id) { index, banner in
                        AsyncImage(url: URL(string: banner.imageUrl)) { phase in
                            switch phase {
                            case .success(let image): image.resizable().scaledToFill()
                            default: Color(.systemGray5)
                            }
                        }
                        .frame(maxWidth: .infinity, minHeight: 180)
                        .clipped()
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .onReceive(Timer.publish(every: 5, on: .main, in: .common).autoconnect()) { _ in
                    guard banners.count > 1 else { return }
                    withAnimation(.easeInOut(duration: 0.4)) { page = (page + 1) % banners.count }
                }

                if banners.count > 1 {
                    HStack(spacing: 6) {
                        ForEach(0..<banners.count, id: \.self) { i in
                            Circle()
                                .fill(i == page ? purple : Color(.systemGray4))
                                .frame(width: 6, height: 6)
                                .animation(.easeInOut(duration: 0.25), value: page)
                        }
                    }
                }
            }
        }
    }
}
