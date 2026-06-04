//
//  ConfigContentfulDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ConfigContentfulDataStore: ConfigDataStore {
    
    func verifyVersion() async throws -> AppVersionDTO {
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Contentful"])
    }
    
    func sendCode(toPhoneNumber phoneNumber: String) async throws -> ValidationCodeDTO {
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Contentful"])
    }
    
    func saveCode(code: String, forPhoneNumber phoneNumber: String) async throws -> ValidationCodeDTO {
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Contentful"])
    }
    
    func getSavedPhoneNumber() async throws -> String {
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Contentful"])
    }
    
    func getSavedCode() async throws -> String {
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Contentful"])
    }
    
    func getDistrict() async throws -> DistrictListDTO {
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Contentful"])
    }
    
    func getVia() async throws -> ViaListDTO {
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Contentful"])
    }
    
    func getLegal() async throws -> [LegalDTO] {
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Contentful"])
    }
    
    func getSecurityToken(credentials: String) async throws -> String {
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Contentful"])
    }
    
    func observeSettings() async throws -> SettingListDTO {
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Contentful"])
    }
    
    func getContentfulDataModel(slug: String) async throws -> ContentfulDataDTO {
        // TODO: Implementar llamada a Contentful API
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getCampaignId(configId: String) async throws -> InkafarmaConfigurationDTO {
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Contentful"])
    }
    
    func getOnboardingData() async throws -> [DataContentType] {
        // TODO: Implementar llamada a Contentful API
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getCoinpurseModalData() async throws -> [DataContentType] {
        // TODO: Implementar llamada a Contentful API
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getMoneyPointsBanners() async throws -> [DataContentType] {
        // TODO: Implementar llamada a Contentful API
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getAndSaveBussinessConfiguration(configId: String) async throws -> InkafarmaConfigurationDTO.ConfigurationDTO.CardConfigurationDTO {
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Contentful"])
    }
    
    func getAndSaveOmnicanalConfiguration(configId: String) async throws -> InkafarmaConfigurationDTO.ConfigurationDTO.OmnicanalConfigurationDTO {
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Contentful"])
    }
    
    func getCoverageArea() async throws -> [CoverageAreaDTO] {
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Contentful"])
    }
    
    func getDataContentTypesBanner(identifier: String) async throws -> [DataContentType] {
        // TODO: Implementar llamada a Contentful API
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getAppReviewUID() async throws -> Bool {
        throw NSError(domain: "ConfigContentfulDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Contentful"])
    }
}
