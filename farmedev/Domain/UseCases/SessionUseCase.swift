//
//  SessionUseCase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SessionUseCase {
    
    private let sessionRepository: SessionRepository
    
    init(sessionRepository: SessionRepository) {
        self.sessionRepository = sessionRepository
    }
    
    func isLogin() async throws -> Bool {
        try await sessionRepository.isLogin()
    }
    
    func logout() async throws -> Bool {
        try await sessionRepository.logout()
    }
    
    func verifyClearData() async throws -> Bool {
        try await sessionRepository.verifyClearData()
    }
    
    func saveDrugstore(request: LocationRequest) async throws -> Bool {
        try await sessionRepository.saveDrugstore(request: request)
    }
    
    func getDrugstore() async throws -> LocationRequest {
        try await sessionRepository.getDrugstore()
    }
    
    func saveVisaPreference(request: SyncOrderRequest) async throws -> Bool {
        try await sessionRepository.saveVisaPreference(request: request)
    }
    
    func clearVisaPreference() async throws -> Bool {
        try await sessionRepository.clearVisaPreference()
    }
    
    func getContentConfig() async throws -> ContentConfig {
        try await sessionRepository.getContentConfig()
    }
    
    func getBusinessContentConfig() -> CardConfiguration {
        sessionRepository.getBusinessContentConfig()
    }
    
    func getOmnicanalContentConfig() -> OmnicanalConfiguration {
        sessionRepository.getOmnicanalContentConfig()
    }
}
