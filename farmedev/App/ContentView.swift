//
//  ContentView.swift
//  farmedev
//

import SwiftUI

struct ContentView: View {
    @Environment(AppState.self) private var appState
    @State private var selectedTab: MainTab = .inicio

    var body: some View {
        MainTabView(selectedTab: $selectedTab)
            .sheet(isPresented: loginGateBinding) {
                AuthCoordinatorView(coordinator: AuthCoordinator())
            }
    }

    /// Bridges `AppState.isPresentingLoginGate` (set by `requireAuth(action:)` when a guest
    /// taps something that needs an account) to a sheet presentation.
    private var loginGateBinding: Binding<Bool> {
        Binding(
            get: { appState.isPresentingLoginGate },
            set: { newValue in
                if !newValue { appState.authGateDidCancel() }
            }
        )
    }
}

#Preview {
    ContentView()
        .environment(AppState())
}
