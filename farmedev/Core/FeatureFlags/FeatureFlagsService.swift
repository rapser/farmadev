//
//  FeatureFlagsService.swift
//  farmedev
//

import Foundation

struct FeatureFlagsService {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClientFactory.shared.client) {
        self.apiClient = apiClient
    }

    func fetchAll() async throws -> [String: Bool] {
        try await apiClient.request(path: "feature-flags", method: .get, body: nil, queryItems: nil)
    }
}
