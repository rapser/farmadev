//
//  ComprasCategoryChips.swift
//  farmedev
//

import SwiftUI

struct ComprasCategoryChips: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                chip("Mifarma Prime")
                chip("Zona Depor",        icon: "cup.and.saucer.fill")
                chip("Cuidado del bebé",  icon: "figure.and.child.holdinghands")
                chip("Rutina",            icon: "repeat")
            }
            .padding(.vertical, 4)
        }
    }

    private func chip(_ title: String, icon: String? = nil) -> some View {
        HStack(spacing: 6) {
            if let icon { Image(systemName: icon).font(.system(size: 14)).foregroundStyle(Color.loginHeaderOrange) }
            Text(title).font(.system(size: 14)).foregroundStyle(.primary)
        }
        .padding(.horizontal, 14).padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 20).fill(.white)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.systemGray4), lineWidth: 1))
        )
    }
}
