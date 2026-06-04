//
//  InicioProductBannerCarousel.swift
//  farmedev
//

import SwiftUI
internal import Combine

struct InicioProductBannerCarousel: View {
    @State private var page: Int = 0

    private let purple = Color(red: 0.4, green: 0.2, blue: 0.6)

    var body: some View {
        VStack(spacing: 10) {
            TabView(selection: $page) {
                productSlide(tag: 0, bg: Color(red: 0.97, green: 0.80, blue: 0.80),
                             badge: "¡Beauty Week!",   title: "Este descuento solo\nlo encuentras aquí",
                             discount1: "30%", discount2: "05%")
                productSlide(tag: 1, bg: Color(red: 0.80, green: 0.90, blue: 0.97),
                             badge: "¡Oferta especial!", title: "Los mejores precios\nen vitaminas",
                             discount1: "20%", discount2: "15%")
                productSlide(tag: 2, bg: Color(red: 0.82, green: 0.95, blue: 0.85),
                             badge: "¡Farmacia!",      title: "Medicamentos al\nmejor precio",
                             discount1: "10%", discount2: "25%")
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 155)
            .cornerRadius(16)
            .onReceive(Timer.publish(every: 5, on: .main, in: .common).autoconnect()) { _ in
                withAnimation(.easeInOut(duration: 0.4)) { page = (page + 1) % 3 }
            }

            HStack(spacing: 6) {
                ForEach(0..<3, id: \.self) { i in
                    Circle()
                        .fill(i == page ? purple : Color(.systemGray4))
                        .frame(width: 7, height: 7)
                        .animation(.easeInOut(duration: 0.25), value: page)
                }
            }
        }
    }

    private func productSlide(tag: Int, bg: Color, badge: String, title: String, discount1: String, discount2: String) -> some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 10) {
                Text(badge)
                    .font(.system(size: 11, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Capsule().fill(Color.loginHeaderOrange))

                Text(title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(Color(red: 0.12, green: 0.12, blue: 0.28))
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)

                HStack(spacing: 8) {
                    discountBadge(discount1)
                    discountBadge(discount2)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)

            ZStack {
                Circle()
                    .fill(.white.opacity(0.35))
                    .frame(width: 100, height: 100)
                Image(systemName: "cross.vial.fill")
                    .font(.system(size: 38))
                    .foregroundStyle(.white.opacity(0.8))
            }
            .padding(.trailing, 12)
        }
        .frame(maxWidth: .infinity, minHeight: 155)
        .background(RoundedRectangle(cornerRadius: 16).fill(bg))
        .tag(tag)
    }

    private func discountBadge(_ value: String) -> some View {
        VStack(spacing: 1) {
            Text(value).font(.system(size: 17, weight: .bold))
            Text("dcto.").font(.system(size: 9))
        }
        .foregroundStyle(Color(red: 0.12, green: 0.12, blue: 0.28))
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(0.85)))
    }
}
