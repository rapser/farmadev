//
//  SyncUseCase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SyncUseCase {
    
    private let syncRepository: SyncRepository

    init(syncRepository: SyncRepository) {
        self.syncRepository = syncRepository
    }
    
    func syncOrder() async throws -> Bool {
        try await syncRepository.syncOrder()
    }
}
