//
//  LoginSocialButtons.swift
//  farmedev
//

import SwiftUI

struct LoginSocialButtons: View {
    @Environment(AppState.self) private var appState

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Otras opciones para ingresar")
                .font(.system(size: 16))
                .foregroundStyle(.primary)

            socialButton(icon: "g.circle.fill", label: "Ingresa con Google",   iconColor: .googleColors)
            socialButton(icon: "f.circle.fill", label: "Ingresa con Facebook", iconColor: .facebookBlue)
            socialButton(icon: "apple.logo",    label: "Ingresa con Apple",    iconColor: .primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func socialButton(icon: String, label: String, iconColor: Color) -> some View {
        Button(action: {
            if label == "Ingresa con Google" {
                appState.loginWithSocial(provider: label)
            }
        }) {
            HStack(spacing: 12) {
                Spacer(minLength: 0)
                Image(systemName: icon).font(.system(size: 24)).foregroundStyle(iconColor)
                Text(label).font(.system(size: 16)).foregroundStyle(.primary)
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 16)
            .frame(height: 52)
        }
        .buttonStyle(LoginSocialButtonStyle())
    }
}
