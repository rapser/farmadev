//
//  SyncCloudDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SyncCloudDataStore: SyncDataStore {
    
    func syncOrder(request: SyncOrderRequest) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "SyncCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
}
