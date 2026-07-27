//
//  CheckoutSummaryView.swift
//  farmedev
//

import SwiftUI

struct CheckoutSummaryView: View {
    @Environment(InicioCoordinator.self) private var coordinator
    @Environment(CheckoutViewModel.self) private var checkoutViewModel
    @State private var cartSummary: CartSummary?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                section(title: "Entrega") {
                    if let address = checkoutViewModel.selectedAddress {
                        Text(address.addressLine).font(.system(size: 14))
                        Text(address.district).font(.system(size: 13)).foregroundStyle(.secondary)
                    } else {
                        Text("Sin dirección seleccionada").foregroundStyle(.secondary)
                    }
                }

                section(title: "Pago") {
                    Text(checkoutViewModel.paymentMethod == .cash ? "Efectivo" : "Tarjeta (contra entrega)")
                        .font(.system(size: 14))
                }

                section(title: "Productos") {
                    if let cartSummary {
                        ForEach(cartSummary.items) { item in
                            HStack {
                                Text("\(cartSummary.quantities[item.id] ?? 1)x \(item.name)").font(.system(size: 13))
                                Spacer()
                            }
                        }
                        Divider()
                        HStack {
                            Text("Subtotal").font(.system(size: 15, weight: .bold))
                            Spacer()
                            Text(CurrencyFormatting.soles(cartSummary.subtotal)).font(.system(size: 15, weight: .bold))
                        }
                    } else {
                        ProgressView()
                    }
                }

                if let errorMessage = checkoutViewModel.errorMessage {
                    Text(errorMessage).foregroundStyle(.red).font(.system(size: 13))
                }

                Button(action: confirm) {
                    Text(checkoutViewModel.isPlacingOrder ? "Confirmando..." : "Confirmar pedido")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.loginHeaderOrange))
                }
                .disabled(checkoutViewModel.isPlacingOrder || checkoutViewModel.selectedAddress == nil)
            }
            .padding(16)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Resumen")
        .navigationBarTitleDisplayMode(.inline)
        .task { cartSummary = await CartSummaryProvider.current() }
    }

    private func section(title: String, @ViewBuilder content: () -> some View) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.system(size: 14, weight: .semibold))
            content()
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 12).fill(.white))
    }

    private func confirm() {
        Task {
            if await checkoutViewModel.placeOrder(), let order = checkoutViewModel.createdOrder {
                coordinator.showOrderConfirmation(orderId: order.id)
            }
        }
    }
}
