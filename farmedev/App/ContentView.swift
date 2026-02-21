//
//  ContentView.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(AppState.self) private var appState
    @State private var selectedTab: MainTab = .inicio

    var body: some View {
        NavigationStack {
            if appState.isLoggedIn {
                MainTabView(selectedTab: $selectedTab)
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(AppState())
}
