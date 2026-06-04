//
//  SyncDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol SyncDataStore {
    func syncOrder(request: SyncOrderRequest) async throws -> EmptyDTO
}
