//
//  CuentaOptionsList.swift
//  farmedev
//
//  Only "Mis direcciones" is wired to a real screen (reuses Checkout's address CRUD).
//  The rest are legal/support placeholders — out of scope, see PLAN.md 2.10.
//

import SwiftUI

struct CuentaOptionsList: View {
    var onAddresses: () -> Void = {}

    private let options: [(icon: String, title: String)] = [
        ("mappin.circle",          "Mis direcciones"),
        ("map",                    "Zonas de cobertura"),
        ("doc.text",               "Legales"),
        ("doc.plaintext",          "Políticas de privacidad"),
        ("doc.text",               "Términos y condiciones"),
        ("building.2",             "Retiro en botica"),
        ("doc.badge.gearshape",    "Tratamiento opcional de datos"),
        ("headphones",             "Atención al cliente"),
        ("square.and.arrow.up",    "Compartir aplicación"),
    ]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.title) { option in
                Button(action: { if option.title == "Mis direcciones" { onAddresses() } }) {
                    HStack {
                        Image(systemName: option.icon).font(.system(size: 20)).foregroundStyle(.primary).frame(width: 28, alignment: .leading)
                        Text(option.title).font(.system(size: 16)).foregroundStyle(.primary)
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 14, weight: .semibold)).foregroundStyle(Color(.systemGray3))
                    }
                    .padding(.horizontal, 20).padding(.vertical, 14)
                }
                .buttonStyle(.plain)
                if option.title != options.last?.title { Divider().padding(.leading, 20) }
            }
        }
        .background(RoundedRectangle(cornerRadius: 16).fill(.white))
        .shadow(color: .black.opacity(0.04), radius: 8, y: 2)
    }
}
