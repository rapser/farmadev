//
//  APIClientFactory.swift
//  farmedev
//
//  Single shared APIClient instance so `setAuthToken` set once at login is visible to
//  every module's DataStores, instead of each DataStore constructing its own client.
//

import Foundation

final class APIClientFactory {
    static let shared = APIClientFactory()

    let interceptor = AuthTokenInterceptor()
    let client: APIClientProtocol

    private init() {
        let client = APIClient(interceptor: interceptor)
        self.client = client
        if let token = SessionStore.loadAccessToken() {
            interceptor.setAccessToken(token)
        }
    }
}
