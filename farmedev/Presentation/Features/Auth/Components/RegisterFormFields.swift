//
//  RegisterFormFields.swift
//  farmedev
//

import SwiftUI

struct RegisterFormFields: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var repeatPassword: String

    let hasMinLength: Bool
    let hasLowercase: Bool
    let hasUppercase: Bool
    let hasNumber:    Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextField("Correo electrónico", text: $email)
                .textFieldStyle(LoginTextFieldStyle())
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .autocorrectionDisabled()

            SecurePasswordField(placeholder: "Crea una contraseña", text: $password)

            LazyVGrid(columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)],
                      alignment: .leading, spacing: 12) {
                requirementRow("Mín 8 caracteres", met: hasMinLength)
                requirementRow("Una minúscula",    met: hasLowercase)
                requirementRow("Una mayúscula",    met: hasUppercase)
                requirementRow("Un número",        met: hasNumber)
            }
            .font(.system(size: 14))
            .foregroundStyle(.secondary)

            SecurePasswordField(placeholder: "Repite tu contraseña", text: $repeatPassword)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func requirementRow(_ label: String, met: Bool) -> some View {
        HStack(spacing: 8) {
            Image(systemName: met ? "checkmark.circle.fill" : "circle")
                .font(.system(size: 14))
                .foregroundStyle(met ? Color.loginHeaderOrange : Color(.systemGray3))
            Text(label)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
