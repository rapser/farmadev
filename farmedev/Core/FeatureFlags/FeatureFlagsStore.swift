//
//  FeatureFlagsStore.swift
//  farmedev
//
//  Cross-cutting infra (lives in Core, not Modules) — any module may read it to gate a
//  campaign or feature on/off remotely (PATCH /feature-flags/:key), without a redeploy.
//  Not a full A/B-testing platform: no rollout percentages, no per-user targeting.
//

import Foundation

@Observable
final class FeatureFlagsStore {
    private(set) var flags: [String: Bool] = [:]
    private let service: FeatureFlagsService

    init(service: FeatureFlagsService = FeatureFlagsService()) {
        self.service = service
    }

    /// Missing/unknown keys default to `true` — a network hiccup or an un-seeded flag
    /// degrades to "on" rather than hiding a feature that was never meant to be gated.
    func isEnabled(_ key: String) -> Bool {
        flags[key] ?? true
    }

    func load() async {
        guard let fetched = try? await service.fetchAll() else { return }
        flags = fetched
    }
}
