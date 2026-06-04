//
//  farmedevApp.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import SwiftUI

@main
struct farmedevApp: App {
    @State private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appState)
        }
    }
}
