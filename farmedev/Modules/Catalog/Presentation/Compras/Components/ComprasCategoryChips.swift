//
//  ComprasCategoryChips.swift
//  farmedev
//

import SwiftUI

struct ComprasCategoryChips: View {
    let categories: [StoreCategoryUI]
    var onTap: (StoreCategoryUI) -> Void = { _ in }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(categories) { category in
                    Button(action: { onTap(category) }) {
                        chip(category.name)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.vertical, 4)
        }
    }

    private func chip(_ title: String) -> some View {
        Text(title).font(.system(size: 14)).foregroundStyle(.primary)
            .padding(.horizontal, 14).padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 20).fill(.white)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.systemGray4), lineWidth: 1))
            )
    }
}
