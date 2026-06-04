//
//  SessionRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol SessionRepository {
    func isLogin() async throws -> Bool
    
    func logout() async throws -> Bool
    
    func verifyClearData() async throws -> Bool
    
    func saveDrugstore(request: LocationRequest) async throws -> Bool
    
    func getDrugstore() async throws -> LocationRequest
    
    func saveVisaPreference(request: SyncOrderRequest) async throws -> Bool
    
    func clearVisaPreference() async throws -> Bool
    
    func getContentConfig() async throws -> ContentConfig
    
    func getBusinessContentConfig() -> CardConfiguration
    
    func getOmnicanalContentConfig() -> OmnicanalConfiguration
}
