//
//  LoginPasswordView.swift
//  farmedev
//
//  Pantalla de contraseña tras ingresar correo (paso 2 del login).
//

import SwiftUI

struct LoginPasswordView: View {
    @Environment(AppState.self) private var appState
    @Environment(\.dismiss) private var dismiss

    let email: String

    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false

    private var canSubmit: Bool {
        !password.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemBackground)
                .ignoresSafeArea()

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

                        ZStack(alignment: .trailing) {
                            Group {
                                if isPasswordVisible {
                                    TextField("Contraseña", text: $password)
                                        .textContentType(.password)
                                } else {
                                    SecureField("Contraseña", text: $password)
                                        .textContentType(.password)
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.trailing, 44)
                            .frame(height: 52)

                            Button(action: { isPasswordVisible.toggle() }) {
                                Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                    .font(.system(size: 20))
                                    .foregroundStyle(Color(.systemGray2))
                            }
                            .padding(.trailing, 16)
                        }
                        .background(Color(.systemBackground))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(.systemGray4), lineWidth: 1)
                        )
                        .cornerRadius(12)

                        NavigationLink(destination: ResetPasswordView()) {
                            Text("¿Olvidaste tu contraseña?")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundStyle(Color.loginLinkPurple)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer(minLength: 40)

                    VStack(spacing: 16) {
                        Button(action: submit) {
                            Text("Ingresar a tu cuenta")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundStyle(canSubmit ? .white : Color(.systemGray2))
                                .frame(maxWidth: .infinity)
                                .frame(height: 52)
                        }
                        .buttonStyle(LoginPrimaryButtonStyle(isEnabled: canSubmit))
                        .disabled(!canSubmit)

                        NavigationLink(destination: RegisterView()) {
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
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.primary)
                }
            }
        }
    }

    private func submit() {
        // Por ahora solo se puede ingresar con Google desde la pantalla principal
    }
}

// Color para título y enlaces de la pantalla de contraseña
extension Color {
    static let loginPasswordTitle = Color(red: 0.25, green: 0.22, blue: 0.29)
    static let loginLinkPurple = Color(red: 0.45, green: 0.35, blue: 0.75)
}

#Preview {
    NavigationStack {
        LoginPasswordView(email: "miguel@gmail.com")
            .environment(AppState())
    }
}
