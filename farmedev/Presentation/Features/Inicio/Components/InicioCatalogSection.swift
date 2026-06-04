//
//  InicioCatalogSection.swift
//  farmedev
//

import SwiftUI

struct InicioCatalogSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Catálogo de productos")
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
                Button("Mostrar todos") {}
                    .font(.system(size: 14))
                    .foregroundStyle(Color(red: 0.4, green: 0.2, blue: 0.6))
            }
            HStack(alignment: .top, spacing: 8) {
                catalogItem(title: "Beauty & Care",     icon: "paintbrush.fill")
                catalogItem(title: "Cuidado Personal",  icon: "drop.fill")
                catalogItem(title: "Wellness",          icon: "heart.fill")
                catalogItem(title: "Cuidado del Bebé",  icon: "figure.and.child.holdinghands")
                catalogItem(title: "Farmacia",          icon: "cross.case.fill")
            }
        }
    }

    private func catalogItem(title: String, icon: String) -> some View {
        VStack(spacing: 6) {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    Image(systemName: icon)
                        .font(.system(size: 22))
                        .foregroundStyle(Color.loginHeaderOrange.opacity(0.7))
                )
                .shadow(color: .black.opacity(0.04), radius: 4)
            Text(title)
                .font(.system(size: 10))
                .foregroundStyle(.primary)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
    }
}
