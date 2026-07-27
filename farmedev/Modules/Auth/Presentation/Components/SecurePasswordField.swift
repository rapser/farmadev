//
//  SecurePasswordField.swift
//  farmedev
//

import SwiftUI

struct SecurePasswordField: View {
    let placeholder: String
    @Binding var text: String
    @State private var isVisible = false

    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isVisible {
                    TextField(placeholder, text: $text).textContentType(.none)
                } else {
                    SecureField(placeholder, text: $text).textContentType(.none)
                }
            }
            .padding(.horizontal, 16)
            .padding(.trailing, 44)
            .frame(height: 52)

            Button(action: { isVisible.toggle() }) {
                Image(systemName: isVisible ? "eye.slash.fill" : "eye.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(Color(.systemGray2))
            }
            .padding(.trailing, 16)
        }
        .background(Color(.systemBackground))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(.systemGray4), lineWidth: 1))
        .cornerRadius(12)
    }
}
