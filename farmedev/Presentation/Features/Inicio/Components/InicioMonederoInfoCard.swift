//
//  InicioMonederoInfoCard.swift
//  farmedev
//

import SwiftUI

struct InicioMonederoInfoCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.loginHeaderOrange.opacity(0.12))
                        .frame(width: 76, height: 76)
                    Image(systemName: "creditcard.fill")
                        .font(.system(size: 28))
                        .foregroundStyle(Color.loginHeaderOrange)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("¿Qué es el Monedero del Ahorro?")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(Color.loginHeaderOrange)

                    Text("Es el programa de **fidelización de Mifarma** que ahora también es digital.")
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                }
            }

            Spacer(minLength: 16)

            Button {} label: {
                Text("Conoce tus beneficios")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(Color.loginLinkPurple)
            }
            .buttonStyle(.plain)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)))
        .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
    }
}
