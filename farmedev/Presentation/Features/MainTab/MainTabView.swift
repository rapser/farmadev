//
//  MainTabView.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import SwiftUI

enum MainTab: Int, CaseIterable {
    case inicio = 0
    case compras = 1
    case cuenta = 2
}

struct MainTabView: View {
    @Binding var selectedTab: MainTab
    @Environment(AppState.self) private var appState

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .inicio:
                    NavigationStack { InicioView() }
                case .compras:
                    NavigationStack { ComprasView() }
                case .cuenta:
                    NavigationStack { CuentaView() }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            customTabBar
        }
        .ignoresSafeArea(.keyboard)
    }

    private var customTabBar: some View {
        HStack(spacing: 0) {
            tabItem(tab: .inicio, icon: "house.fill", label: "Inicio")
            Spacer()
            tabItem(tab: .compras, icon: "plus", label: "Compras", isFAB: true)
            Spacer()
            tabItem(tab: .cuenta, icon: "person.fill", label: "Cuenta")
        }
        .padding(.horizontal, 24)
        .padding(.top, 12)
        .padding(.bottom, 28)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.06), radius: 12, y: -4)
        )
        .padding(.horizontal, 8)
    }

    @ViewBuilder
    private func tabItem(tab: MainTab, icon: String, label: String, isFAB: Bool = false) -> some View {
        if isFAB {
            Button {
                selectedTab = .compras
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.loginHeaderOrange)
                        .frame(width: 56, height: 56)
                    Image(systemName: "plus")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color.mifarmaGreen)
                }
                .offset(y: -18)
            }
            .buttonStyle(.plain)
        } else {
            Button {
                selectedTab = tab
            } label: {
                VStack(spacing: 4) {
                    Image(systemName: icon)
                        .font(.system(size: 22))
                    Text(label)
                        .font(.system(size: 11))
                    Rectangle()
                        .fill(selectedTab == tab ? Color.loginHeaderOrange : Color.clear)
                        .frame(width: 32, height: 3)
                        .cornerRadius(1.5)
                }
                .foregroundStyle(selectedTab == tab ? Color.loginHeaderOrange : Color(.systemGray))
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    @Previewable @State var tab: MainTab = .inicio
    return MainTabView(selectedTab: $tab)
        .environment(AppState())
}
