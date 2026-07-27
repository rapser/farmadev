//
//  OrderConfirmationView.swift
//  farmedev
//

import SwiftUI

struct OrderConfirmationView: View {
    @Environment(InicioCoordinator.self) private var coordinator
    let orderId: String

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 64))
                .foregroundStyle(Color.mifarmaGreen)

            Text("¡Pedido confirmado!")
                .font(.system(size: 20, weight: .bold))

            Text("Tu pedido #\(orderId.prefix(8)) fue registrado correctamente.")
                .font(.system(size: 14))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Spacer()

            Button(action: { coordinator.popToRoot() }) {
                Text("Volver al inicio")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.loginHeaderOrange))
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
        .navigationBarBackButtonHidden(true)
    }
}
