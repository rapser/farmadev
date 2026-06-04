//
//  ConfigDataRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ConfigDataRepository: ConfigRepository {
    
    private let configDataStoreFactory: ConfigDataStoreFactory
    private let sessionDataStoreFactory: SessionDataStoreFactory
    
    init(
        configDataStoreFactory: ConfigDataStoreFactory,
        sessionDataStoreFactory: SessionDataStoreFactory
    ) {
        self.configDataStoreFactory = configDataStoreFactory
        self.sessionDataStoreFactory = sessionDataStoreFactory
    }
    
    func verifyVersion() async throws -> AppVersion {
        let cloudDataStore = configDataStoreFactory.createCloud()
        let appVersionDTO = try await cloudDataStore.verifyVersion()
        return appVersionDTO.toDomain()
    }
    
    func sendCode(toPhoneNumber phoneNumber: String) async throws -> ValidationCode {
        let localDataStore = configDataStoreFactory.createLocal()
        let cloudDataStore = configDataStoreFactory.createCloud()
        
        let validationCodeDTO = try await cloudDataStore.sendCode(toPhoneNumber: phoneNumber)
        _ = try await localDataStore.saveCode(code: validationCodeDTO.value ?? "", forPhoneNumber: phoneNumber)
        return validationCodeDTO.toDomain()
    }
    
    func getAttemptedPhoneNumber() async throws -> String {
        let localDataStore = configDataStoreFactory.createLocal()
        return try await localDataStore.getSavedPhoneNumber()
    }
    
    func resendCode() async throws -> ValidationCode {
        let localDataStore = configDataStoreFactory.createLocal()
        let cloudDataStore = configDataStoreFactory.createCloud()
        
        let phoneNumber = try await localDataStore.getSavedPhoneNumber()
        let validationCodeDTO = try await cloudDataStore.sendCode(toPhoneNumber: phoneNumber)
        let savedCodeDTO = try await localDataStore.saveCode(code: validationCodeDTO.value ?? "", forPhoneNumber: phoneNumber)
        return savedCodeDTO.toDomain()
    }
    
    func validateCode(code: String) async throws -> Bool {
        let localDataStore = configDataStoreFactory.createLocal()
        let savedCode = try await localDataStore.getSavedCode()
        // TODO: Implementar hash MD5 si es necesario
        return code.lowercased() == savedCode.lowercased()
    }
    
    func getDistrict() async throws -> DistrictList {
        let cloudDataStore = configDataStoreFactory.createCloud()
        let districtListDTO = try await cloudDataStore.getDistrict()
        return districtListDTO.toDomain()
    }
    
    func getVia() async throws -> ViaList {
        let cloudDataStore = configDataStoreFactory.createCloud()
        let viaListDTO = try await cloudDataStore.getVia()
        return viaListDTO.toDomain()
    }
    
    func getLegal() async throws -> [Legal] {
        let cloudDataStore = configDataStoreFactory.createCloud()
        let legalDTOs = try await cloudDataStore.getLegal()
        return legalDTOs.map { $0.toDomain() }
    }
    
    func getSecurityToken(credentials: String) async throws -> String {
        let cloudDataStore = configDataStoreFactory.createCloud()
        return try await cloudDataStore.getSecurityToken(credentials: credentials)
    }
    
    func updateSettings() async throws -> Bool {
        let cloudDataStore = configDataStoreFactory.createCloud()
        _ = try await cloudDataStore.observeSettings()
        // TODO: Implementar guardado de settings
        return true
    }
    
    func getContentfulDataModel(slug: String) async throws -> ContentfulData {
        let contentfulDataStore = configDataStoreFactory.createContentful()
        let contentfulDataDTO = try await contentfulDataStore.getContentfulDataModel(slug: slug)
        return ContentfulData(
            title: contentfulDataDTO.title,
            slug: contentfulDataDTO.slug,
            description: contentfulDataDTO.description,
            items: contentfulDataDTO.items?.map { itemDTO in
                ContentfulDataItem(title: itemDTO.title, content: itemDTO.content)
            }
        )
    }
    
    func getCampaignId(configId: String) async throws -> InkafarmaConfigurationItem {
        let cloudDataStore = configDataStoreFactory.createCloud()
        let inkafarmaConfigDTO = try await cloudDataStore.getCampaignId(configId: configId)
        let domainConfig = inkafarmaConfigDTO.toDomain()
        
        // Extraer InkafarmaConfigurationItem de la configuración
        if case .inkafarmaConfig(let configItem) = domainConfig.configuration {
            return InkafarmaConfigurationItem(campaignId: configItem.idCampaign)
        }
        
        return InkafarmaConfigurationItem(campaignId: nil)
    }
    
    func getAndSaveBussinessConfiguration(configId: String) async throws -> CardConfiguration {
        let cloudDataStore = configDataStoreFactory.createCloud()
        let cardConfigDTO = try await cloudDataStore.getAndSaveBussinessConfiguration(configId: configId)
        // TODO: Guardar en local si es necesario
        // TODO: Crear mapper para CardConfigurationDTO
        return CardConfiguration(
            cardsAssociatedDefault: cardConfigDTO.cardsAssociatedDefault,
            cardsAssociated: cardConfigDTO.cardsAssociated?.map { cardDTO in
                CardsAssociated(
                    id: cardDTO.id,
                    name: cardDTO.name,
                    valueTalon: cardDTO.valueTalon,
                    text: cardDTO.text,
                    image: cardDTO.image,
                    textSubTotal: cardDTO.textSubTotal,
                    textTotal: cardDTO.textTotal,
                    textSavedMoney: cardDTO.textSavedMoney
                )
            }
        )
    }
    
    func getAndSaveOmnicanalConfiguration(configId: String) async throws -> OmnicanalConfiguration {
        let cloudDataStore = configDataStoreFactory.createCloud()
        let omnicanalConfigDTO = try await cloudDataStore.getAndSaveOmnicanalConfiguration(configId: configId)
        // TODO: Guardar en local si es necesario
        // TODO: Crear mapper para OmnicanalConfigurationDTO
        return OmnicanalConfiguration(
            quantity: omnicanalConfigDTO.quantity,
            statusModal: omnicanalConfigDTO.statusModal,
            title: omnicanalConfigDTO.title,
            imageUrl: omnicanalConfigDTO.imageUrl,
            text: omnicanalConfigDTO.text,
            button: omnicanalConfigDTO.button
        )
    }
    
    func getOnboardingData() async throws -> [DataContentType] {
        let contentfulDataStore = configDataStoreFactory.createContentful()
        return try await contentfulDataStore.getOnboardingData()
    }
    
    func getMoneyPointsBanners() async throws -> [DataContentType] {
        let contentfulDataStore = configDataStoreFactory.createContentful()
        return try await contentfulDataStore.getMoneyPointsBanners()
    }
    
    func getAppReviewUID() async throws -> Bool {
        let localDataStore = configDataStoreFactory.createLocal()
        return try await localDataStore.getAppReviewUID()
    }
    
    func getCoverageArea() async throws -> [CoverageArea] {
        let cloudDataStore = configDataStoreFactory.createCloud()
        let coverageAreaDTOs = try await cloudDataStore.getCoverageArea()
        return coverageAreaDTOs.map { $0.toDomain() }
    }
    
    func getCoinpurseModalData() async throws -> [DataContentType] {
        let contentfulDataStore = configDataStoreFactory.createContentful()
        return try await contentfulDataStore.getCoinpurseModalData()
    }
    
    func getDataContentTypesBanner(identifier: String) async throws -> [DataContentType] {
        let contentfulDataStore = configDataStoreFactory.createContentful()
        return try await contentfulDataStore.getDataContentTypesBanner(identifier: identifier)
    }
}
