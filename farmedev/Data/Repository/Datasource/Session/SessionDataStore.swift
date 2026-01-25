//
//  SessionDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol SessionDataStore {
    func saveToken(token: String) async throws
    
    func saveSocialLoginEmail(_ email: String, forProvider provider: AuthenticationProvider) async throws
    
    func isLogin() async throws -> Bool
    
    func logout() async throws -> Bool
    
    func verifyClearData() async throws -> Bool
    
    func saveDrugstore(request: LocationRequest) async throws -> Bool
    
    func getDrugstore() async throws -> LocationRequest
    
    func saveVisaPreference(request: SyncOrderRequest) async throws -> Bool
    
    func getVisaPreference() async throws -> SyncOrderRequest
    
    func clearVisaPreference() async throws -> Bool
    
    func saveContentConfig(contentConfig: ContentConfig) async throws -> Bool
    
    func getContentConfig() async throws -> ContentConfig
    
    func saveBusinessContentConfig(contentConfig: CardConfiguration) async throws -> CardConfiguration
    
    func saveOmnicanalContentConfig(contentConfig: OmnicanalConfiguration) async throws -> OmnicanalConfiguration
    
    func getBusinessContentConfig() -> CardConfiguration
    
    func getOmnicanalContentConfig() -> OmnicanalConfiguration
}
