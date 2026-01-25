//
//  ConfigLocalDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ConfigLocalDataStore: ConfigDataStore {
    
    private let keyValidationCode = "code"
    private let keyPhoneSmsAttempt = "phone_sms_attempt"
    
    func verifyVersion() async throws -> AppVersionDTO {
        // No se implementa en Local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func sendCode(toPhoneNumber phoneNumber: String) async throws -> ValidationCodeDTO {
        // No se implementa en Local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func saveCode(code: String, forPhoneNumber phoneNumber: String) async throws -> ValidationCodeDTO {
        UserDefaults.standard.set(code, forKey: keyValidationCode)
        UserDefaults.standard.set(phoneNumber, forKey: keyPhoneSmsAttempt)
        return ValidationCodeDTO(value: code)
    }
    
    func getSavedPhoneNumber() async throws -> String {
        UserDefaults.standard.string(forKey: keyPhoneSmsAttempt) ?? ""
    }
    
    func getSavedCode() async throws -> String {
        UserDefaults.standard.string(forKey: keyValidationCode) ?? ""
    }
    
    func getDistrict() async throws -> DistrictListDTO {
        // No se implementa en Local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getVia() async throws -> ViaListDTO {
        // No se implementa en Local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getLegal() async throws -> [LegalDTO] {
        // No se implementa en Local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getSecurityToken(credentials: String) async throws -> String {
        // No se implementa en Local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func observeSettings() async throws -> SettingListDTO {
        // TODO: Implementar obtención desde almacenamiento local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getContentfulDataModel(slug: String) async throws -> ContentfulDataDTO {
        // No se implementa en Local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getCampaignId(configId: String) async throws -> InkafarmaConfigurationDTO {
        // No se implementa en Local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not available locally"])
    }
    
    func getOnboardingData() async throws -> [DataContentType] {
        // TODO: Implementar obtención desde almacenamiento local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getCoinpurseModalData() async throws -> [DataContentType] {
        // TODO: Implementar obtención desde almacenamiento local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getMoneyPointsBanners() async throws -> [DataContentType] {
        // TODO: Implementar obtención desde almacenamiento local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getAndSaveBussinessConfiguration(configId: String) async throws -> InkafarmaConfigurationDTO.ConfigurationDTO.CardConfigurationDTO {
        // TODO: Implementar guardado y obtención desde almacenamiento local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getAndSaveOmnicanalConfiguration(configId: String) async throws -> InkafarmaConfigurationDTO.ConfigurationDTO.OmnicanalConfigurationDTO {
        // TODO: Implementar guardado y obtención desde almacenamiento local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getCoverageArea() async throws -> [CoverageAreaDTO] {
        // TODO: Implementar obtención desde almacenamiento local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getDataContentTypesBanner(identifier: String) async throws -> [DataContentType] {
        // TODO: Implementar obtención desde almacenamiento local
        throw NSError(domain: "ConfigLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getAppReviewUID() async throws -> Bool {
        // TODO: Implementar obtención desde UserDefaults
        UserDefaults.standard.bool(forKey: "APP_REVIEW_UID")
    }
}
