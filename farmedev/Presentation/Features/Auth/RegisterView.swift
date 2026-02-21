//
//  RegisterView.swift
//  farmedev
//
//  Pantalla "Regístrate" (crear cuenta).
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isRepeatPasswordVisible: Bool = false

    private var hasMinLength: Bool { password.count >= 8 }
    private var hasLowercase: Bool { password.contains(where: { $0.isLowercase }) }
    private var hasUppercase: Bool { password.contains(where: { $0.isUppercase }) }
    private var hasNumber: Bool { password.contains(where: { $0.isNumber }) }
    private var allRequirementsMet: Bool { hasMinLength && hasLowercase && hasUppercase && hasNumber }
    private var passwordsMatch: Bool { !repeatPassword.isEmpty && password == repeatPassword }

    private var canSubmit: Bool {
        !email.trimmingCharacters(in: .whitespaces).isEmpty
            && allRequirementsMet
            && passwordsMatch
    }

    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemBackground)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Regístrate")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(Color.loginPasswordTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        VStack(alignment: .leading, spacing: 16) {
                            TextField("Correo electrónico", text: $email)
                                .textFieldStyle(LoginTextFieldStyle())
                                .textContentType(.emailAddress)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .autocorrectionDisabled()

                            passwordField(
                                placeholder: "Crea una contraseña",
                                text: $password,
                                isVisible: $isPasswordVisible
                            )

                            LazyVGrid(columns: [
                                GridItem(.flexible(), spacing: 12),
                                GridItem(.flexible(), spacing: 12)
                            ], alignment: .leading, spacing: 12) {
                                requirementRow("Mín 8 caracteres", met: hasMinLength)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                requirementRow("Una minúscula", met: hasLowercase)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                requirementRow("Una mayúscula", met: hasUppercase)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                requirementRow("Un número", met: hasNumber)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(.secondary)

                            passwordField(
                                placeholder: "Repite tu contraseña",
                                text: $repeatPassword,
                                isVisible: $isRepeatPasswordVisible
                            )
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 20)
                    .padding(.bottom, 24)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                Button(action: submit) {
                    Text("Siguiente")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(canSubmit ? .white : Color(.systemGray2))
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                }
                .buttonStyle(LoginPrimaryButtonStyle(isEnabled: canSubmit))
                .disabled(!canSubmit)
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
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

    private func passwordField(placeholder: String, text: Binding<String>, isVisible: Binding<Bool>) -> some View {
        ZStack(alignment: .trailing) {
            Group {
                if isVisible.wrappedValue {
                    TextField(placeholder, text: text)
                        .textContentType(.newPassword)
                } else {
                    SecureField(placeholder, text: text)
                        .textContentType(.newPassword)
                }
            }
            .padding(.horizontal, 16)
            .padding(.trailing, 44)
            .frame(height: 52)

            Button(action: { isVisible.wrappedValue.toggle() }) {
                Image(systemName: isVisible.wrappedValue ? "eye.slash.fill" : "eye.fill")
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
    }

    @ViewBuilder
    private func requirementRow(_ label: String, met: Bool) -> some View {
        HStack(spacing: 8) {
            Image(systemName: met ? "checkmark.circle.fill" : "circle")
                .font(.system(size: 14))
                .foregroundStyle(met ? Color.loginHeaderOrange : Color(.systemGray3))
            Text(label)
        }
    }

    private func submit() {
        // TODO: continuar flujo de registro
        dismiss()
    }
}

#Preview {
    NavigationStack {
        RegisterView()
    }
}
