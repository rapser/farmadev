//
//  APIEnvironment.swift
//  farmedev
//
//  Base URL configuration, driven by the active scheme (farmedev-QA / farmedev-Prod)
//  via Config/QA.xcconfig / Config/Prod.xcconfig -> Info.plist's API_BASE_URL key.
//

import Foundation

enum APIEnvironment {

    /// Base URL read from Info.plist (set per-scheme via xcconfig). Falls back to localhost
    /// if missing (e.g. running the legacy default "farmedev" scheme, which doesn't set it).
    static var current: URL {
        guard
            let value = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String,
            !value.isEmpty,
            let url = URL(string: value)
        else {
            return URL(string: "http://localhost:3000/api/v1")!
        }
        return url
    }

    /// Override for physical-device testing against a Mac's LAN IP instead of localhost.
    static func custom(_ url: URL) -> URL { url }
}
