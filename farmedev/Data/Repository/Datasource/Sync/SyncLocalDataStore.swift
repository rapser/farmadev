//
//  SyncLocalDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SyncLocalDataStore: SyncDataStore {
    
    func syncOrder(request: SyncOrderRequest) async throws -> EmptyDTO {
        // No se implementa en Local
        throw NSError(domain: "SyncLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
}
