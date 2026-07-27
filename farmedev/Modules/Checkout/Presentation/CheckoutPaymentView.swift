//
//  CheckoutPaymentView.swift
//  farmedev
//
//  Simple cash/card choice — no real payment gateway (out of scope, PLAN.md 2.10).
//

import SwiftUI

struct CheckoutPaymentView: View {
    @Environment(InicioCoordinator.self) private var coordinator
    @Environment(CheckoutViewModel.self) private var checkoutViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Método de pago")
                .font(.system(size: 18, weight: .bold))

            paymentOption(.cash, title: "Efectivo", icon: "banknote")
            paymentOption(.card, title: "Tarjeta (contra entrega)", icon: "creditcard")

            Spacer()

            Button(action: { coordinator.showCheckoutSummary() }) {
                Text("Continuar")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.loginHeaderOrange))
            }
        }
        .padding(16)
        .navigationTitle("Pago")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func paymentOption(_ method: CheckoutPaymentMethod, title: String, icon: String) -> some View {
        Button(action: { checkoutViewModel.paymentMethod = method }) {
            HStack {
                Image(systemName: icon).foregroundStyle(Color.loginHeaderOrange)
                Text(title).foregroundStyle(.primary)
                Spacer()
                Image(systemName: checkoutViewModel.paymentMethod == method ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(checkoutViewModel.paymentMethod == method ? Color.loginHeaderOrange : Color(.systemGray4))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 12).fill(.white))
        }
        .buttonStyle(.plain)
    }
}
