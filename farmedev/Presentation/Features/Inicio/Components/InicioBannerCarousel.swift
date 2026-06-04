//
//  InicioBannerCarousel.swift
//  farmedev
//

import SwiftUI
internal import Combine

struct InicioBannerCarousel: View {
    @State private var page: Int = 0

    private let purple = Color(red: 0.4, green: 0.2, blue: 0.6)

    var body: some View {
        VStack(spacing: 10) {
            TabView(selection: $page) {
                bannerSlide(tag: 0, bg: Color(red: 0.1, green: 0.1, blue: 0.35),
                            eyebrow: "Encuentra tus", bold1: "CUPONES", mid: "de", bold2: "DESCUENTO",
                            accentColor: Color.loginHeaderOrange, button: "Aquí")
                bannerSlide(tag: 1, bg: Color(red: 0.28, green: 0.1, blue: 0.45),
                            eyebrow: "Descuentos especiales", bold1: "AHORRA", mid: "en tus", bold2: "MEDICAMENTOS",
                            accentColor: Color(red: 1, green: 0.85, blue: 0.2), button: "Ver más")
                bannerSlide(tag: 2, bg: Color(red: 0.08, green: 0.28, blue: 0.42),
                            eyebrow: "Monedero del Ahorro", bold1: "GANA", mid: "puntos en cada", bold2: "COMPRA",
                            accentColor: Color.mifarmaGreen, button: "Únete")
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 100)
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

    private func bannerSlide(tag: Int, bg: Color, eyebrow: String, bold1: String, mid: String, bold2: String, accentColor: Color, button: String) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(eyebrow)
                    .font(.system(size: 13))
                    .foregroundStyle(.white.opacity(0.85))
                HStack(spacing: 4) {
                    Text(bold1).font(.system(size: 17, weight: .bold)).foregroundStyle(.white)
                    Text(mid).font(.system(size: 12)).foregroundStyle(.white.opacity(0.85))
                    Text(bold2).font(.system(size: 15, weight: .bold)).foregroundStyle(accentColor)
                }
            }
            Spacer()
            Button {} label: {
                Text(button)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(bg)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(Capsule().fill(.white))
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 18)
        .frame(maxWidth: .infinity, minHeight: 100)
        .background(RoundedRectangle(cornerRadius: 16).fill(bg))
        .tag(tag)
    }
}
