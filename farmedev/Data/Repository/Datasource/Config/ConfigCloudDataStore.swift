//
//  ConfigCloudDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ConfigCloudDataStore: ConfigDataStore {
    
    func verifyVersion() async throws -> AppVersionDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func sendCode(toPhoneNumber phoneNumber: String) async throws -> ValidationCodeDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func saveCode(code: String, forPhoneNumber phoneNumber: String) async throws -> ValidationCodeDTO {
        // No se implementa en Cloud
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Cloud"])
    }
    
    func getSavedPhoneNumber() async throws -> String {
        // No se implementa en Cloud
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Cloud"])
    }
    
    func getSavedCode() async throws -> String {
        // No se implementa en Cloud
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available in Cloud"])
    }
    
    func getDistrict() async throws -> DistrictListDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getVia() async throws -> ViaListDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getLegal() async throws -> [LegalDTO] {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getSecurityToken(credentials: String) async throws -> String {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func observeSettings() async throws -> SettingListDTO {
        // TODO: Implementar observación de Firebase o API REST
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getContentfulDataModel(slug: String) async throws -> ContentfulDataDTO {
        // TODO: Implementar llamada a Contentful API
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getCampaignId(configId: String) async throws -> InkafarmaConfigurationDTO {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getOnboardingData() async throws -> [DataContentType] {
        // TODO: Implementar llamada a Contentful API
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getCoinpurseModalData() async throws -> [DataContentType] {
        // TODO: Implementar llamada a Contentful API
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getMoneyPointsBanners() async throws -> [DataContentType] {
        // TODO: Implementar llamada a Contentful API
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getAndSaveBussinessConfiguration(configId: String) async throws -> InkafarmaConfigurationDTO.ConfigurationDTO.CardConfigurationDTO {
        // TODO: Implementar llamada a API REST y extraer CardConfigurationDTO de InkafarmaConfigurationDTO
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getAndSaveOmnicanalConfiguration(configId: String) async throws -> InkafarmaConfigurationDTO.ConfigurationDTO.OmnicanalConfigurationDTO {
        // TODO: Implementar llamada a API REST y extraer OmnicanalConfigurationDTO de InkafarmaConfigurationDTO
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getCoverageArea() async throws -> [CoverageAreaDTO] {
        // TODO: Implementar llamada a API REST
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getDataContentTypesBanner(identifier: String) async throws -> [DataContentType] {
        // TODO: Implementar llamada a Contentful API
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getAppReviewUID() async throws -> Bool {
        // TODO: Implementar obtención desde UserDefaults o API
        throw NSError(domain: "ConfigCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
}
