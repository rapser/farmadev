//
//  SessionDataRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SessionDataRepository: SessionRepository {
    
    private let sessionDataStoreFactory: SessionDataStoreFactory
    
    init(sessionDataStoreFactory: SessionDataStoreFactory) {
        self.sessionDataStoreFactory = sessionDataStoreFactory
    }
    
    func isLogin() async throws -> Bool {
        let sessionDataStore = sessionDataStoreFactory.createLocal()
        return try await sessionDataStore.isLogin()
    }
    
    func logout() async throws -> Bool {
        let sessionDataStore = sessionDataStoreFactory.createLocal()
        return try await sessionDataStore.logout()
    }
    
    func verifyClearData() async throws -> Bool {
        let sessionDataStore = sessionDataStoreFactory.createLocal()
        return try await sessionDataStore.verifyClearData()
    }
    
    func saveDrugstore(request: LocationRequest) async throws -> Bool {
        let sessionDataStore = sessionDataStoreFactory.createLocal()
        return try await sessionDataStore.saveDrugstore(request: request)
    }
    
    func getDrugstore() async throws -> LocationRequest {
        let sessionDataStore = sessionDataStoreFactory.createLocal()
        return try await sessionDataStore.getDrugstore()
    }
    
    func saveVisaPreference(request: SyncOrderRequest) async throws -> Bool {
        let sessionDataStore = sessionDataStoreFactory.createLocal()
        return try await sessionDataStore.saveVisaPreference(request: request)
    }
    
    func clearVisaPreference() async throws -> Bool {
        let sessionDataStore = sessionDataStoreFactory.createLocal()
        return try await sessionDataStore.clearVisaPreference()
    }
    
    func getContentConfig() async throws -> ContentConfig {
        let sessionDataStore = sessionDataStoreFactory.createLocal()
        return try await sessionDataStore.getContentConfig()
    }
    
    func getBusinessContentConfig() -> CardConfiguration {
        let sessionDataStore = sessionDataStoreFactory.createLocal()
        return sessionDataStore.getBusinessContentConfig()
    }
    
    func getOmnicanalContentConfig() -> OmnicanalConfiguration {
        let sessionDataStore = sessionDataStoreFactory.createLocal()
        return sessionDataStore.getOmnicanalContentConfig()
    }
}
