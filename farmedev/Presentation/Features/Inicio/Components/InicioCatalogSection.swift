//
//  InicioCatalogSection.swift
//  farmedev
//

import SwiftUI

struct InicioCatalogSection: View {
    let categories: [StoreCategoryUI]
    var onTapCategory: (StoreCategoryUI) -> Void = { _ in }
    var onShowAll: () -> Void = {}

    var body: some View {
        if categories.isEmpty {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Catálogo de productos")
                        .font(.system(size: 16, weight: .semibold))
                    Spacer()
                    Button("Mostrar todos", action: onShowAll)
                        .font(.system(size: 14))
                        .foregroundStyle(Color(red: 0.4, green: 0.2, blue: 0.6))
                }
                HStack(alignment: .top, spacing: 8) {
                    ForEach(categories) { category in
                        catalogItem(category)
                    }
                }
            }
        }
    }

    private func catalogItem(_ category: StoreCategoryUI) -> some View {
        Button(action: { onTapCategory(category) }) {
            VStack(spacing: 6) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .aspectRatio(1, contentMode: .fit)
                    .overlay(
                        AsyncImage(url: URL(string: category.iconUrl ?? "")) { phase in
                            switch phase {
                            case .success(let image):
                                image.resizable().scaledToFit().padding(8)
                            default:
                                Image(systemName: "cross.case.fill")
                                    .font(.system(size: 22))
                                    .foregroundStyle(Color.loginHeaderOrange.opacity(0.7))
                            }
                        }
                    )
                    .shadow(color: .black.opacity(0.04), radius: 4)
                Text(category.name)
                    .font(.system(size: 10))
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
    }
}
