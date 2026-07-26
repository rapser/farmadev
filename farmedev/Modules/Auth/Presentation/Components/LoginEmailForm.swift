//
//  LoginEmailForm.swift
//  farmedev
//

import SwiftUI

struct LoginEmailForm: View {
    @Environment(AuthCoordinator.self) private var coordinator
    @Binding var email: String

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Ingresa tu correo para continuar")
                .font(.system(size: 16))
                .foregroundStyle(.primary)

            TextField("Correo electrónico", text: $email)
                .textFieldStyle(LoginTextFieldStyle())
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .autocorrectionDisabled()

            let trimmed = email.trimmingCharacters(in: .whitespaces)
            Button(action: { coordinator.showLoginPassword(email: trimmed) }) {
                Text("Ingresar")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
            }
            .buttonStyle(LoginPrimaryButtonStyle(isEnabled: !trimmed.isEmpty))
            .disabled(trimmed.isEmpty)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
