//
//  LoginView.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import SwiftUI

struct LoginView: View {
    @Environment(AppState.self) private var appState
    @State private var email: String = ""

    private let headerCurveHeight: CGFloat = 36

    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemBackground)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                headerSection
                formSection
            }
        }
        .navigationBarHidden(true)
    }

    // MARK: - Header (orange with curved bottom)

    private var headerSection: some View {
        ZStack(alignment: .bottom) {
            Color.loginHeaderOrange
                .ignoresSafeArea(edges: .top)

            mifarmaLogo
                .padding(.horizontal, 32)

            OrangeHeaderCurve(height: headerCurveHeight)
                .fill(Color.loginHeaderOrange)
                .frame(height: headerCurveHeight)
                .offset(y: 1)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
    }

    private var mifarmaLogo: some View {
        Text("Mifarma")
            .font(.system(size: 32, weight: .bold))
            .foregroundStyle(.white)
    }

    // MARK: - Form (email + social) — dos subvistas centradas en pantalla, sin depender del header

    private var formSection: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 20)
            VStack(alignment: .leading, spacing: 24) {
                // Subvista 1: Ingresa tu correo (título, caja de texto, botón)
                VStack(alignment: .leading, spacing: 16) {
                    Text("Ingresa tu correo para continuar")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.primary)

                    TextField("Correo electrónico", text: $email)
                        .textFieldStyle(LoginTextFieldStyle())
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()

                    NavigationLink(destination: LoginPasswordView(email: email.trimmingCharacters(in: .whitespaces))) {
                        Text("Ingresar")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                    }
                    .buttonStyle(LoginPrimaryButtonStyle(isEnabled: !email.trimmingCharacters(in: .whitespaces).isEmpty))
                    .disabled(email.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                // Subvista 2: Otras opciones (título, 3 botones)
                VStack(alignment: .leading, spacing: 16) {
                    Text("Otras opciones para ingresar")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.primary)

                    socialButton(icon: "g.circle.fill", label: "Ingresa con Google", iconColor: .googleColors)
                    socialButton(icon: "f.circle.fill", label: "Ingresa con Facebook", iconColor: Color.facebookBlue)
                    socialButton(icon: "apple.logo", label: "Ingresa con Apple", iconColor: .primary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity)
            Spacer(minLength: 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func socialButton(icon: String, label: String, iconColor: Color) -> some View {
        let isGoogle = (label == "Ingresa con Google")
        return Button(action: {
            if isGoogle { appState.loginWithSocial(provider: label) }
        }) {
            HStack(spacing: 12) {
                Spacer(minLength: 0)
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundStyle(iconColor)
                Text(label)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.primary)
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 16)
            .frame(height: 52)
        }
        .buttonStyle(LoginSocialButtonStyle())
    }
}

// MARK: - Orange header curve shape

struct OrangeHeaderCurve: Shape {
    var height: CGFloat = 36

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = height
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: h))
        path.addQuadCurve(
            to: CGPoint(x: w, y: h),
            control: CGPoint(x: w / 2, y: h + 42)
        )
        path.addLine(to: CGPoint(x: w, y: 0))
        path.closeSubpath()
        return path
    }
}

// MARK: - TextField style

struct LoginTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 16)
            .frame(height: 52)
            .background(Color(.systemBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
            .cornerRadius(12)
    }
}

// MARK: - Primary button style (gray when disabled, orange when enabled)

struct LoginPrimaryButtonStyle: ButtonStyle {
    let isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isEnabled ? Color.loginHeaderOrange : Color(.systemGray4))
            )
            .cornerRadius(12)
            .opacity(configuration.isPressed && isEnabled ? 0.9 : 1)
    }
}

// MARK: - Social button style (white, bordered)

struct LoginSocialButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
            .opacity(configuration.isPressed ? 0.95 : 1)
    }
}

// MARK: - Brand colors

extension Color {
    static let loginHeaderOrange = Color(red: 232/255, green: 93/255, blue: 4/255)
    static let mifarmaGreen = Color(red: 0.2, green: 0.7, blue: 0.4)
    static let facebookBlue = Color(red: 24/255, green: 119/255, blue: 242/255)
    static var googleColors: Color { .primary }
}

#Preview {
    LoginView()
        .environment(AppState())
}
