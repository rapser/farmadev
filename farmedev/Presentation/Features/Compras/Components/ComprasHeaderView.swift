//
//  ComprasHeaderView.swift
//  farmedev
//

import SwiftUI

struct ComprasHeaderView: View {
    @Binding var searchText: String

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.loginHeaderOrange
            OrangeHeaderCurve(height: 55).fill(Color.loginHeaderOrange).frame(height: 55).offset(y: 1)
            HStack {
                Image(systemName: "magnifyingglass").foregroundStyle(Color(.systemGray))
                TextField("¿Qué buscaremos hoy?", text: $searchText).foregroundStyle(.primary)
            }
            .font(.system(size: 16))
            .padding(.horizontal, 14).padding(.vertical, 10)
            .background(RoundedRectangle(cornerRadius: 14).fill(.white))
            .padding(.horizontal, 20).padding(.top, 10).padding(.bottom, 20)
        }
    }
}
