//
//  ConfigRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol ConfigRepository {
    func verifyVersion() async throws -> AppVersion
    
    func sendCode(toPhoneNumber: String) async throws -> ValidationCode
    
    func getAttemptedPhoneNumber() async throws -> String
    
    func resendCode() async throws -> ValidationCode
    
    func validateCode(code: String) async throws -> Bool
    
    func getDistrict() async throws -> DistrictList
    
    func getVia() async throws -> ViaList
    
    func getLegal() async throws -> [Legal]
    
    func getSecurityToken(credentials: String) async throws -> String
    
    func updateSettings() async throws -> Bool
    
    func getContentfulDataModel(slug: String) async throws -> ContentfulData
    
    func getCampaignId(configId: String) async throws -> InkafarmaConfigurationItem
    
    func getAndSaveBussinessConfiguration(configId: String) async throws -> CardConfiguration
    
    func getAndSaveOmnicanalConfiguration(configId: String) async throws -> OmnicanalConfiguration
    
    func getOnboardingData() async throws -> [DataContentType]
    
    func getMoneyPointsBanners() async throws -> [DataContentType]
    
    func getAppReviewUID() async throws -> Bool
    
    func getCoverageArea() async throws -> [CoverageArea]
    
    func getCoinpurseModalData() async throws -> [DataContentType]
    
    func getDataContentTypesBanner(identifier: String) async throws -> [DataContentType]
}
