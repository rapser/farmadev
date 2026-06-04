//
//  ContentView.swift
//  farmedev
//

import SwiftUI

struct ContentView: View {
    @Environment(AppState.self) private var appState
    @State private var authCoordinator = AuthCoordinator()
    @State private var selectedTab: MainTab = .inicio

    var body: some View {
        if appState.isLoggedIn {
            MainTabView(selectedTab: $selectedTab)
        } else {
            AuthCoordinatorView(coordinator: authCoordinator)
        }
    }
}

#Preview {
    ContentView()
        .environment(AppState())
}
