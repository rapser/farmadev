//
//  InicioMonederoSection.swift
//  farmedev
//

import SwiftUI

struct InicioMonederoSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Monedero del Ahorro")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.primary)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    monederoAction(icon: "square.grid.2x2", label: "Ver todo",         borderColor: Color(red: 0.4, green: 0.2, blue: 0.6))
                    monederoAction(icon: "star.circle",     label: "Juega a la ruleta", bgColor: Color(red: 0.4, green: 0.2, blue: 0.6))
                    monederoAction(icon: "percent",         label: "Tienes 15 cupones", bgColor: Color(red: 0.2, green: 0.4, blue: 0.8))
                    monederoAction(icon: "mappin.circle",   label: "Consulta de stock", bgColor: Color(red: 0.2, green: 0.6, blue: 0.7))
                }
            }
        }
    }

    private func monederoAction(icon: String, label: String, borderColor: Color? = nil, bgColor: Color? = nil) -> some View {
        VStack(spacing: 8) {
            ZStack {
                if let bg = bgColor {
                    Circle().fill(bg).frame(width: 56, height: 56)
                } else {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(borderColor ?? .clear, lineWidth: 2)
                        .frame(width: 56, height: 56)
                }
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundStyle(.white)
            }
            Text(label)
                .font(.system(size: 11))
                .foregroundStyle(.primary)
                .lineLimit(1)
                .multilineTextAlignment(.center)
        }
        .frame(width: 80)
    }
}
