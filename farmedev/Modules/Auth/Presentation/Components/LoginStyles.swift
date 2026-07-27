//
//  LoginStyles.swift
//  farmedev
//

import SwiftUI

// MARK: - Shapes

struct OrangeHeaderCurve: Shape {
    var height: CGFloat = 36
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addQuadCurve(to: CGPoint(x: rect.width, y: height),
                          control: CGPoint(x: rect.width / 2, y: height + 65))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.closeSubpath()
        return path
    }
}

// MARK: - TextFieldStyle

struct LoginTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 16)
            .frame(height: 52)
            .background(Color(.systemBackground))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(.systemGray4), lineWidth: 1))
            .cornerRadius(12)
    }
}

// MARK: - ButtonStyles

struct LoginPrimaryButtonStyle: ButtonStyle {
    let isEnabled: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(RoundedRectangle(cornerRadius: 12)
                .fill(isEnabled ? Color.loginHeaderOrange : Color(.systemGray4)))
            .cornerRadius(12)
            .opacity(configuration.isPressed && isEnabled ? 0.9 : 1)
    }
}

struct LoginSocialButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemBackground)))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(.systemGray4), lineWidth: 1))
            .opacity(configuration.isPressed ? 0.95 : 1)
    }
}

// MARK: - Colors

extension Color {
    static let loginHeaderOrange  = Color(red: 232/255, green: 93/255, blue: 4/255)
    static let mifarmaGreen       = Color(red: 0.2, green: 0.7, blue: 0.4)
    static let facebookBlue       = Color(red: 24/255, green: 119/255, blue: 242/255)
    static var googleColors: Color { .primary }
    static let loginPasswordTitle = Color(red: 0.25, green: 0.22, blue: 0.29)
    static let loginLinkPurple    = Color(red: 0.45, green: 0.35, blue: 0.75)
}
