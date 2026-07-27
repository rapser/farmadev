//
//  InicioBannerCarousel.swift
//  farmedev
//

import SwiftUI
internal import Combine

struct InicioBannerCarousel: View {
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
                        bannerSlide(banner).tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 100)
                .cornerRadius(16)
                .onReceive(Timer.publish(every: 5, on: .main, in: .common).autoconnect()) { _ in
                    guard banners.count > 1 else { return }
                    withAnimation(.easeInOut(duration: 0.4)) { page = (page + 1) % banners.count }
                }

                if banners.count > 1 {
                    HStack(spacing: 6) {
                        ForEach(0..<banners.count, id: \.self) { i in
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

    private func bannerSlide(_ banner: StoreBannerUI) -> some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: banner.imageUrl)) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().scaledToFill()
                default:
                    Color(red: 0.1, green: 0.1, blue: 0.35)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 100)
            .clipped()

            if let title = banner.title {
                Text(title)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        LinearGradient(colors: [.black.opacity(0.55), .clear], startPoint: .bottom, endPoint: .top)
                    )
            }
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(red: 0.1, green: 0.1, blue: 0.35)))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
