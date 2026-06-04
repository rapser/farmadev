//
//  InicioHeaderView.swift
//  farmedev
//

import SwiftUI

struct InicioHeaderView: View {
    @Environment(AppState.self) private var appState
    @Binding var searchText: String

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.loginHeaderOrange

            InicioHeaderCurve()
                .fill(Color.loginHeaderOrange)
                .frame(height: 65)
                .offset(y: 1)

            VStack(alignment: .leading, spacing: 12) {
                Text("Hola \(appState.userDisplayName)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color(.systemGray))
                    TextField("¿Qué buscaremos hoy?", text: $searchText)
                        .foregroundStyle(.primary)
                }
                .font(.system(size: 16))
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(RoundedRectangle(cornerRadius: 14).fill(.white))
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 20)
        }
    }
}

struct InicioHeaderCurve: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: h))
        path.addQuadCurve(to: CGPoint(x: w, y: h), control: CGPoint(x: w / 2, y: h + 140))
        path.addLine(to: CGPoint(x: w, y: 0))
        path.closeSubpath()
        return path
    }
}
