//
//  InicioSavingsCards.swift
//  farmedev
//

import SwiftUI

struct InicioSavingsCards: View {
    var body: some View {
        HStack(spacing: 12) {
            savingsCard(title: "Ahorraste", amount: "S/ 0.33", subtitle: "Últimos 12 meses",  icon: "dollarsign.circle.fill")
            savingsCard(title: "Tienes",    amount: "S/ 5.42", subtitle: "Equivalen a 542 pts.", icon: "centsign.circle.fill")
        }
    }

    private func savingsCard(title: String, amount: String, subtitle: String, icon: String) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundStyle(Color.loginHeaderOrange)
                Text(amount)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(Color(red: 0.4, green: 0.2, blue: 0.6))
                Text(subtitle)
                    .font(.system(size: 9, weight: .medium))
                    .foregroundStyle(.secondary)
            }
            Spacer(minLength: 0)
            Image(systemName: icon)
                .font(.system(size: 32))
                .foregroundStyle(Color.loginHeaderOrange.opacity(0.5))
        }
        .padding(.top, 16)
        .padding(.leading, 16)
        .padding(.bottom, 16)
        .padding(.trailing, 0)
        .background(RoundedRectangle(cornerRadius: 16).fill(.white))
        .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
    }
}
