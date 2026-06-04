//
//  ComprasBannerCarousel.swift
//  farmedev
//

import SwiftUI
internal import Combine

struct ComprasBannerCarousel: View {
    @State private var page: Int = 0
    private let purple = Color(red: 0.4, green: 0.2, blue: 0.6)

    var body: some View {
        VStack(spacing: 10) {
            TabView(selection: $page) {
                ForEach(0..<5, id: \.self) { index in
                    ZStack {
                        RoundedRectangle(cornerRadius: 16).fill(Color(.systemGray5))
                        VStack(spacing: 8) {
                            Image(systemName: "photo").font(.system(size: 44)).foregroundStyle(Color(.systemGray3))
                            Text("Banner \(index + 1)").font(.system(size: 12)).foregroundStyle(Color(.systemGray3))
                        }
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .onReceive(Timer.publish(every: 5, on: .main, in: .common).autoconnect()) { _ in
                withAnimation(.easeInOut(duration: 0.4)) { page = (page + 1) % 5 }
            }

            HStack(spacing: 6) {
                ForEach(0..<5, id: \.self) { i in
                    Circle()
                        .fill(i == page ? purple : Color(.systemGray4))
                        .frame(width: 6, height: 6)
                        .animation(.easeInOut(duration: 0.25), value: page)
                }
            }
        }
    }
}
