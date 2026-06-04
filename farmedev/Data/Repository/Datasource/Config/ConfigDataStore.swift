//
//  ConfigDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol ConfigDataStore {
    func verifyVersion() async throws -> AppVersionDTO
    
    func sendCode(toPhoneNumber phoneNumber: String) async throws -> ValidationCodeDTO
    
    func saveCode(code: String, forPhoneNumber phoneNumber: String) async throws -> ValidationCodeDTO
    
    func getSavedPhoneNumber() async throws -> String
    
    func getSavedCode() async throws -> String
    
    func getDistrict() async throws -> DistrictListDTO
    
    func getVia() async throws -> ViaListDTO
    
    func getLegal() async throws -> [LegalDTO]
    
    func getSecurityToken(credentials: String) async throws -> String
    
    func observeSettings() async throws -> SettingListDTO
    
    func getContentfulDataModel(slug: String) async throws -> ContentfulDataDTO
    
    func getCampaignId(configId: String) async throws -> InkafarmaConfigurationDTO
    
    func getOnboardingData() async throws -> [DataContentType]
    
    func getCoinpurseModalData() async throws -> [DataContentType]
    
    func getMoneyPointsBanners() async throws -> [DataContentType]
    
    func getAndSaveBussinessConfiguration(configId: String) async throws -> InkafarmaConfigurationDTO.ConfigurationDTO.CardConfigurationDTO
    
    func getAndSaveOmnicanalConfiguration(configId: String) async throws -> InkafarmaConfigurationDTO.ConfigurationDTO.OmnicanalConfigurationDTO
    
    func getCoverageArea() async throws -> [CoverageAreaDTO]
    
    func getDataContentTypesBanner(identifier: String) async throws -> [DataContentType]
    
    func getAppReviewUID() async throws -> Bool
}
