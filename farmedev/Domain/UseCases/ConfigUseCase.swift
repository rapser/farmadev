//
//  ConfigUseCase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ConfigUseCase {
    
    private let configRepository: ConfigRepository
    
    init(configRepository: ConfigRepository) {
        self.configRepository = configRepository
    }
    
    func verifyVersion() async throws -> AppVersion {
        try await configRepository.verifyVersion()
    }
    
    func sendCodePhone(_ request: SendCodePhoneRequest) async throws -> ValidationCode {
        try await configRepository.sendCode(toPhoneNumber: request.phoneNumber)
    }
    
    func getAttemptedPhoneNumber() async throws -> String {
        try await configRepository.getAttemptedPhoneNumber()
    }
    
    func resendCode() async throws -> ValidationCode {
        try await configRepository.resendCode()
    }
    
    func validateCode(code: String) async throws -> Bool {
        try await configRepository.validateCode(code: code)
    }
    
    func getDistrict() async throws -> DistrictList {
        try await configRepository.getDistrict()
    }
    
    func getVia() async throws -> ViaList {
        try await configRepository.getVia()
    }
    
    func getLegal() async throws -> [Legal] {
        try await configRepository.getLegal()
    }
    
    func getSecurityToken(credentials: String) async throws -> String {
        try await configRepository.getSecurityToken(credentials: credentials)
    }
    
    func updateSettings() async throws -> Bool {
        try await configRepository.updateSettings()
    }
    
    func getContentfulDataModel(slug: String) async throws -> ContentfulData {
        try await configRepository.getContentfulDataModel(slug: slug)
    }
    
    func getCampaignId(configId: String) async throws -> InkafarmaConfigurationItem {
        try await configRepository.getCampaignId(configId: configId)
    }
    
    func getAndSaveBussinessConfiguration(configId: String) async throws -> CardConfiguration {
        try await configRepository.getAndSaveBussinessConfiguration(configId: configId)
    }
    
    func getAndSaveOmnicanalConfiguration(configId: String) async throws -> OmnicanalConfiguration {
        try await configRepository.getAndSaveOmnicanalConfiguration(configId: configId)
    }
    
    func getOnboardingData() async throws -> [DataContentType] {
        try await configRepository.getOnboardingData()
    }
    
    func getMoneyPointsBanners() async throws -> [DataContentType] {
        try await configRepository.getMoneyPointsBanners()
    }
    
    func getAppReviewUID() async throws -> Bool {
        try await configRepository.getAppReviewUID()
    }
    
    func getCoverageArea() async throws -> [CoverageArea] {
        try await configRepository.getCoverageArea()
    }
    
    func getCoinpurseModalData() async throws -> [DataContentType] {
        try await configRepository.getCoinpurseModalData()
    }
    
    func getDataContentTypesBanner(identifier: String) async throws -> [DataContentType] {
        try await configRepository.getDataContentTypesBanner(identifier: identifier)
    }
}
