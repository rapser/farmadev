//
//  OrderDetailView.swift
//  farmedev
//

import SwiftUI

struct OrderDetailView: View {
    let order: StoreOrder

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Pedido #\(order.id.prefix(8))").font(.system(size: 18, weight: .bold))
                    Text(order.status.capitalized).font(.system(size: 14, weight: .medium)).foregroundStyle(Color.loginHeaderOrange)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Entrega").font(.system(size: 14, weight: .semibold))
                    Text(order.deliveryAddressLine).font(.system(size: 14))
                    Text(order.deliveryDistrict).font(.system(size: 13)).foregroundStyle(.secondary)
                    if let reference = order.deliveryReference, !reference.isEmpty {
                        Text(reference).font(.system(size: 13)).foregroundStyle(.secondary)
                    }
                    Text(order.paymentMethod == "cash" ? "Pago en efectivo" : "Pago con tarjeta")
                        .font(.system(size: 13)).foregroundStyle(.secondary)
                }
                .padding(14)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 12).fill(.white))

                VStack(alignment: .leading, spacing: 10) {
                    Text("Productos").font(.system(size: 14, weight: .semibold))
                    ForEach(order.items) { item in
                        HStack {
                            Text("\(item.quantity)x \(item.productName)").font(.system(size: 13))
                            Spacer()
                            Text(CurrencyFormatting.soles(item.lineTotal)).font(.system(size: 13, weight: .medium))
                        }
                    }
                    Divider()
                    HStack {
                        Text("Total").font(.system(size: 15, weight: .bold))
                        Spacer()
                        Text(CurrencyFormatting.soles(order.total)).font(.system(size: 15, weight: .bold))
                    }
                }
                .padding(14)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 12).fill(.white))
            }
            .padding(16)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Detalle del pedido")
        .navigationBarTitleDisplayMode(.inline)
    }
}
