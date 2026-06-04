//
//  SyncDataRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SyncDataRepository: SyncRepository {
    
    private let syncDataStoreFactory: SyncDataStoreFactory
    private let sessionDataStoreFactory: SessionDataStoreFactory
    
    init(
        syncDataStoreFactory: SyncDataStoreFactory,
        sessionDataStoreFactory: SessionDataStoreFactory
    ) {
        self.syncDataStoreFactory = syncDataStoreFactory
        self.sessionDataStoreFactory = sessionDataStoreFactory
    }
    
    func syncOrder() async throws -> Bool {
        let sessionDataStore = sessionDataStoreFactory.createLocal()
        let cloudDataStore = syncDataStoreFactory.createCloud()
        
        let request = try await sessionDataStore.getVisaPreference()
        
        if request.purchaseNumber != nil {
            _ = try await cloudDataStore.syncOrder(request: request)
            _ = try await sessionDataStore.clearVisaPreference()
        }
        
        return true
    }
}
