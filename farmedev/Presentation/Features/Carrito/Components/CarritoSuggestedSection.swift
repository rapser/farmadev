//
//  CarritoSuggestedSection.swift
//  farmedev
//

import SwiftUI
internal import Combine

struct CarritoSuggestedSection: View {
    @State private var currentPage: Int = 0

    private let pageCount = 5
    private let products: [(name: String, price: String)] = [
        ("Desodorante Antitranspirante Rollon", "S/ 65.90"),
        ("Dermolimpiador Facial Sebamed",       "S/ 50.00"),
        ("Crema Hidratante SPF50",              "S/ 89.00"),
        ("Vitamina C 1000mg",                  "S/ 35.00"),
        ("Shampoo Anticaspa",                  "S/ 28.90"),
        ("Ibuprofeno 400mg x 10 tab",          "S/ 12.50"),
        ("Amoxicilina 500mg x 12 cap",         "S/ 18.90"),
        ("Loratadina 10mg x 10 tab",           "S/ 9.50"),
        ("Omeprazol 20mg x 14 cap",            "S/ 14.00"),
        ("Paracetamol 1g x 10 tab",            "S/ 8.90"),
    ]

    var body: some View {
        HStack(spacing: 0) {
            Rectangle().fill(Color.loginHeaderOrange).frame(width: 4)

            VStack(alignment: .leading, spacing: 12) {
                Text("¿No olvidas nada? 👀")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.primary)

                TabView(selection: $currentPage) {
                    ForEach(0..<pageCount, id: \.self) { page in
                        HStack(spacing: 12) {
                            CarritoProductCard(name: products[page * 2].name,     price: products[page * 2].price)
                            CarritoProductCard(name: products[page * 2 + 1].name, price: products[page * 2 + 1].price)
                        }
                        .tag(page)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 185)
                .onReceive(Timer.publish(every: 3, on: .main, in: .common).autoconnect()) { _ in
                    withAnimation(.easeInOut(duration: 0.4)) { currentPage = (currentPage + 1) % pageCount }
                }

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
            .padding(16)
        }
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
        .clipped()
    }
}

struct CarritoProductCard: View {
    let name: String
    let price: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: 10).fill(Color(.systemGroupedBackground)).frame(height: 100)
                    .overlay(Image(systemName: "photo").font(.system(size: 30)).foregroundStyle(Color(.systemGray4)))
                Button(action: {}) {
                    Circle().fill(Color.loginHeaderOrange).frame(width: 28, height: 28)
                        .overlay(Image(systemName: "plus").font(.system(size: 13, weight: .bold)).foregroundStyle(.white))
                }
                .buttonStyle(.plain).offset(x: 4, y: -4)
            }
            Text(name).font(.system(size: 12)).foregroundStyle(.primary).lineLimit(2).fixedSize(horizontal: false, vertical: true)
            Text("Desde \(price)").font(.system(size: 12, weight: .bold)).foregroundStyle(Color.loginHeaderOrange)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
