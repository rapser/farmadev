//
//  RegisterView.swift
//  farmedev
//

import SwiftUI

struct RegisterView: View {
    @Environment(AppState.self) private var appState
    @Environment(AuthCoordinator.self) private var coordinator

    @State private var fullName: String = ""
    @State private var surname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    @State private var isSubmitting = false

    private var hasMinLength:  Bool { password.count >= 8 }
    private var hasLowercase:  Bool { password.contains(where: { $0.isLowercase }) }
    private var hasUppercase:  Bool { password.contains(where: { $0.isUppercase }) }
    private var hasNumber:     Bool { password.contains(where: { $0.isNumber }) }
    private var allMet:        Bool { hasMinLength && hasLowercase && hasUppercase && hasNumber }
    private var passwordsMatch: Bool { !repeatPassword.isEmpty && password == repeatPassword }
    private var canSubmit:     Bool {
        !fullName.trimmingCharacters(in: .whitespaces).isEmpty
            && !surname.trimmingCharacters(in: .whitespaces).isEmpty
            && !email.trimmingCharacters(in: .whitespaces).isEmpty
            && allMet && passwordsMatch && !isSubmitting
    }

    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemBackground).ignoresSafeArea()
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Regístrate")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(Color.loginPasswordTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        RegisterFormFields(
                            fullName: $fullName,
                            surname: $surname,
                            email: $email,
                            password: $password,
                            repeatPassword: $repeatPassword,
                            hasMinLength: hasMinLength,
                            hasLowercase: hasLowercase,
                            hasUppercase: hasUppercase,
                            hasNumber: hasNumber
                        )

                        if let message = appState.authErrorMessage {
                            Text(message)
                                .font(.system(size: 14))
                                .foregroundStyle(.red)
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 20)
                    .padding(.bottom, 24)
                }

                Button(action: submit) {
                    Text(isSubmitting ? "Creando cuenta..." : "Siguiente")
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
                Button(action: { coordinator.pop() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.primary)
                }
            }
        }
    }

    private func submit() {
        guard canSubmit else { return }
        isSubmitting = true
        Task {
            do {
                try await appState.register(email: email, password: password, fullName: fullName, surname: surname)
                isSubmitting = false
                appState.authGateDidSucceed()
            } catch {
                isSubmitting = false
            }
        }
    }
}
