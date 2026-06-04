//
//  ComprasProductRow.swift
//  farmedev
//

import SwiftUI

struct ComprasProductRow: View {
    let title: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(title).font(.system(size: 16, weight: .semibold)).foregroundStyle(.primary)
                Spacer()
                Button("Ver todos") {}.font(.system(size: 14)).foregroundStyle(Color(red: 0.4, green: 0.2, blue: 0.6))
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<6, id: \.self) { i in
                        ZStack {
                            RoundedRectangle(cornerRadius: 12).fill(.white)
                                .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
                            VStack(spacing: 6) {
                                Image(systemName: "photo").font(.system(size: 28)).foregroundStyle(Color(.systemGray4))
                                Text("Producto \(i + 1)").font(.system(size: 10)).foregroundStyle(Color(.systemGray4))
                            }
                        }
                        .frame(width: 110, height: 130)
                    }
                }
            }
        }
    }
}
