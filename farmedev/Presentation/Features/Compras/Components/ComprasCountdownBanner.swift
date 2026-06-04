//
//  ComprasCountdownBanner.swift
//  farmedev
//

import SwiftUI

struct ComprasCountdownBanner: View {
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: "alarm.fill").font(.system(size: 36)).foregroundStyle(.red)
            Text("¡Aprovecha los mejores descuentos!")
                .font(.system(size: 15, weight: .bold)).foregroundStyle(.white).multilineTextAlignment(.leading)
            Spacer()
            VStack(spacing: 6) {
                countdownBox("10", unit: "HORAS")
                countdownBox("06", unit: "MINUTOS")
                countdownBox("35", unit: "SEGUNDOS")
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient(colors: [Color.loginHeaderOrange, Color.loginHeaderOrange.opacity(0.85)],
                                     startPoint: .topLeading, endPoint: .bottomTrailing))
        )
    }

    private func countdownBox(_ value: String, unit: String) -> some View {
        VStack(spacing: 2) {
            Text(value).font(.system(size: 16, weight: .bold))
            Text(unit).font(.system(size: 9))
        }
        .foregroundStyle(.white)
        .frame(width: 64, height: 48)
        .background(RoundedRectangle(cornerRadius: 8).fill(.black.opacity(0.35)))
    }
}
