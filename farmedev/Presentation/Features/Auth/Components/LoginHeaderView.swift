//
//  LoginHeaderView.swift
//  farmedev
//

import SwiftUI

struct LoginHeaderView: View {
    var height: CGFloat = 36

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.loginHeaderOrange.ignoresSafeArea(edges: .top)
            Text("Mifarma")
                .font(.system(size: 32, weight: .bold))
                .foregroundStyle(.white)
                .padding(.horizontal, 32)
            OrangeHeaderCurve(height: height)
                .fill(Color.loginHeaderOrange)
                .frame(height: height)
                .offset(y: 1)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 40)
    }
}
