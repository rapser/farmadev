//
//  CarritoItemsList.swift
//  farmedev
//

import SwiftUI

struct CarritoItemsList: View {
    let items: [CartItem]
    var onUpdateQuantity: (String, Int) -> Void
    var onRemove: (String) -> Void

    var body: some View {
        VStack(spacing: 12) {
            ForEach(items) { item in
                HStack(spacing: 12) {
                    AsyncImage(url: URL(string: item.imageUrl)) { phase in
                        switch phase {
                        case .success(let image): image.resizable().scaledToFit()
                        default: Color(.systemGray5)
                        }
                    }
                    .frame(width: 56, height: 56)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.productName)
                            .font(.system(size: 14, weight: .medium))
                            .lineLimit(2)
                        Text(CurrencyFormatting.soles(item.unitPrice))
                            .font(.system(size: 13))
                            .foregroundStyle(Color.loginHeaderOrange)
                    }

                    Spacer()

                    HStack(spacing: 10) {
                        Button {
                            onUpdateQuantity(item.productId, item.quantity - 1)
                        } label: {
                            Image(systemName: "minus.circle")
                        }
                        Text("\(item.quantity)").font(.system(size: 14, weight: .semibold))
                        Button {
                            onUpdateQuantity(item.productId, item.quantity + 1)
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                    .foregroundStyle(Color.loginHeaderOrange)

                    Button {
                        onRemove(item.productId)
                    } label: {
                        Image(systemName: "trash")
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 12).fill(.white))
            }
        }
    }
}
