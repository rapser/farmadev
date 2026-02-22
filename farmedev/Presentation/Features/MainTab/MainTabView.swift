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
            tabItem(tab: .compras, icon: "plus", label: "Compras", isFAB: true)
            tabItem(tab: .cuenta, icon: "person.fill", label: "Cuenta")
        }
        .padding(.top, 0)
        .padding(.bottom, 6)
        .background(
            Color(.systemBackground)
                .ignoresSafeArea(edges: .bottom)
        )
        .overlay(alignment: .top) {
            Rectangle()
                .fill(Color(.separator))
                .frame(height: 0.5)
        }
    }

    @ViewBuilder
    private func tabItem(tab: MainTab, icon: String, label: String, isFAB: Bool = false) -> some View {
        if isFAB {
            Button {
                selectedTab = .compras
            } label: {
                VStack(spacing: 2) {
                    ZStack {
                        Circle()
                            .fill(Color.loginHeaderOrange)
                            .frame(width: 42, height: 42)
                        Image(systemName: "plus")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.white)
                    }
                    Text("Compras")
                        .font(.system(size: 10))
                        .foregroundStyle(selectedTab == .compras ? Color.loginHeaderOrange : Color(.systemGray))
                }
                .offset(y: -10)
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.plain)
        } else {
            Button {
                selectedTab = tab
            } label: {
                VStack(spacing: 3) {
                    Rectangle()
                        .fill(selectedTab == tab ? Color.loginHeaderOrange : Color.clear)
                        .frame(width: 32, height: 3)
                        .cornerRadius(1.5)
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .padding(.top, 3)
                    Text(label)
                        .font(.system(size: 10))
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
