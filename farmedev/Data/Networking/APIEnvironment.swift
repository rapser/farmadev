//
//  APIEnvironment.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//
//  Configuration:
//  - Development: .mockoon uses http://localhost:3000 (run Mockoon on your Mac, port 3000).
//  - Physical device: Use .custom(URL(string: "http://YOUR_MAC_IP:3000")!) so the device can reach Mockoon.
//  - Production: Switch to .custom(URL(string: "https://your-api.example.com")!) and build with Release.
//

import Foundation

/// Base URL and configuration for the API. Use Mockoon (localhost:3000) for development.
/// For physical device use your Mac's IP (e.g. http://192.168.1.x:3000).
enum APIEnvironment {

    /// Mockoon mock server (default for development).
    case mockoon

    /// Custom base URL (e.g. production).
    case custom(URL)

    var baseURL: URL {
        switch self {
        case .mockoon:
            return URL(string: "http://localhost:3000")!
        case .custom(let url):
            return url
        }
    }

    /// Current environment. Change to .custom(productionURL) for release.
    static var current: APIEnvironment {
        #if DEBUG
        return .mockoon
        #else
        return .mockoon
        #endif
    }
}
