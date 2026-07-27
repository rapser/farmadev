//
//  farmedevApp.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import SwiftUI
import SwiftData
import GoogleMaps

@main
struct farmedevApp: App {
    @State private var appState = AppState()
    @State private var featureFlagsStore = FeatureFlagsStore()

    init() {
        if let key = Bundle.main.object(forInfoDictionaryKey: "GOOGLE_MAPS_API_KEY") as? String,
           !key.isEmpty, !key.hasPrefix("REPLACE_WITH") {
            GMSServices.provideAPIKey(key)
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appState)
                .environment(featureFlagsStore)
                .task { await featureFlagsStore.load() }
                .modelContainer(LocalCartContainer.shared)
        }
    }
}
