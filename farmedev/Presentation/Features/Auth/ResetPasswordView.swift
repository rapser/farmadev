//
//  ResetPasswordView.swift
//  farmedev
//
//  Pantalla "Restablecer mi contraseña" (olvidaste contraseña).
//

import SwiftUI

struct ResetPasswordView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var email: String = ""

    private var canSubmit: Bool {
        !email.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemBackground)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer(minLength: 20)
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Restablecer mi contraseña")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(Color.loginPasswordTitle)

                        Text("Ingresa tu correo para iniciar el restablecimiento de tu contraseña")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(.secondary)
                    }

                    TextField("Correo electrónico", text: $email)
                        .textFieldStyle(LoginTextFieldStyle())
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()

                    Spacer(minLength: 40)

                    Button(action: submit) {
                        Text("Restablecer contraseña")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundStyle(canSubmit ? .white : Color(.systemGray2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                    }
                    .buttonStyle(LoginPrimaryButtonStyle(isEnabled: canSubmit))
                    .disabled(!canSubmit)
                }
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer(minLength: 20)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.primary)
                }
            }
        }
    }

    private func submit() {
        // TODO: llamar API de restablecimiento
        dismiss()
    }
}

#Preview {
    NavigationStack {
        ResetPasswordView()
    }
}
