//
//  OrderHistoryView.swift
//  farmedev
//

import SwiftUI

struct OrderHistoryView: View {
    @State private var viewModel = OrderHistoryViewModel()
    var onTapOrder: (StoreOrder) -> Void = { _ in }

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()

    var body: some View {
        ScrollView {
            if viewModel.orders.isEmpty && !viewModel.isLoading {
                Text("Aún no tienes pedidos.")
                    .foregroundStyle(.secondary)
                    .padding(.top, 60)
            } else {
                VStack(spacing: 12) {
                    ForEach(viewModel.orders) { order in
                        Button(action: { onTapOrder(order) }) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Pedido #\(order.id.prefix(8))")
                                        .font(.system(size: 14, weight: .semibold))
                                    Text(Self.dateFormatter.string(from: order.createdAt))
                                        .font(.system(size: 12))
                                        .foregroundStyle(.secondary)
                                    Text(order.status.capitalized)
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundStyle(Color.loginHeaderOrange)
                                }
                                Spacer()
                                Text(CurrencyFormatting.soles(order.total))
                                    .font(.system(size: 15, weight: .bold))
                            }
                            .padding(14)
                            .background(RoundedRectangle(cornerRadius: 12).fill(.white))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(16)
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Mis pedidos")
        .navigationBarTitleDisplayMode(.inline)
        .task { await viewModel.load() }
        .refreshable { await viewModel.load() }
    }
}
