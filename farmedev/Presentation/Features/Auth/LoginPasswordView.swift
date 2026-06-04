//
//  LoginPasswordView.swift
//  farmedev
//

import SwiftUI

struct LoginPasswordView: View {
    @Environment(AppState.self) private var appState
    @Environment(AuthCoordinator.self) private var coordinator

    let email: String
    @State private var password: String = ""

    private var canSubmit: Bool { !password.trimmingCharacters(in: .whitespaces).isEmpty }

    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemBackground).ignoresSafeArea()
            VStack(spacing: 0) {
                Spacer(minLength: 20)
                VStack(alignment: .leading, spacing: 24) {
                    Text("Ingresa con tu correo")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(Color.loginPasswordTitle)

                    VStack(alignment: .leading, spacing: 16) {
                        TextField("Correo electrónico", text: .constant(email))
                            .textFieldStyle(LoginTextFieldStyle())
                            .disabled(true)
                            .foregroundStyle(.secondary)

                        SecurePasswordField(placeholder: "Contraseña", text: $password)

                        Button(action: { coordinator.showResetPassword() }) {
                            Text("¿Olvidaste tu contraseña?")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundStyle(Color.loginLinkPurple)
                        }
                    }

                    Spacer(minLength: 40)

                    VStack(spacing: 16) {
                        Button(action: { appState.login(email: email) }) {
                            Text("Ingresar a tu cuenta")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundStyle(canSubmit ? .white : Color(.systemGray2))
                                .frame(maxWidth: .infinity)
                                .frame(height: 52)
                        }
                        .buttonStyle(LoginPrimaryButtonStyle(isEnabled: canSubmit))
                        .disabled(!canSubmit)

                        Button(action: { coordinator.showRegister() }) {
                            Text("Crear cuenta")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundStyle(Color.loginLinkPurple)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer(minLength: 20)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: { coordinator.pop() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.primary)
                }
            }
        }
    }
}
