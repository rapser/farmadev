//
//  SessionLocalDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SessionLocalDataStore: SessionDataStore {
    
    func saveToken(token: String) async throws {
        // TODO: Implementar guardado de token en UserDefaults o Keychain
        UserDefaults.standard.set(token, forKey: "auth_token")
    }
    
    func saveSocialLoginEmail(_ email: String, forProvider provider: AuthenticationProvider) async throws {
        // TODO: Implementar guardado de email de login social
        UserDefaults.standard.set(email, forKey: "social_login_email")
        UserDefaults.standard.set(provider.rawValue, forKey: "social_login_provider")
    }
    
    func isLogin() async throws -> Bool {
        // TODO: Implementar verificación de login
        UserDefaults.standard.bool(forKey: "is_logged_in")
    }
    
    func logout() async throws -> Bool {
        // TODO: Implementar logout
        UserDefaults.standard.removeObject(forKey: "auth_token")
        UserDefaults.standard.removeObject(forKey: "is_logged_in")
        UserDefaults.standard.removeObject(forKey: "social_login_email")
        UserDefaults.standard.removeObject(forKey: "social_login_provider")
        return true
    }
    
    func verifyClearData() async throws -> Bool {
        // TODO: Implementar verificación de limpieza de datos
        true
    }
    
    func saveDrugstore(request: LocationRequest) async throws -> Bool {
        // TODO: Implementar guardado de drugstore
        // Por ahora placeholder
        true
    }
    
    func getDrugstore() async throws -> LocationRequest {
        // TODO: Implementar obtención de drugstore guardado
        // Por ahora retorna un LocationRequest vacío
        LocationRequest(
            address: nil,
            number: nil,
            district: nil,
            latitude: nil,
            longitude: nil,
            drugstore: nil,
            isLocationAddress: nil,
            changeAddress: nil,
            coverageAddress: nil,
            enabled: nil,
            zoneId: nil
        )
    }
    
    func saveVisaPreference(request: SyncOrderRequest) async throws -> Bool {
        // TODO: Implementar guardado de preferencia Visa
        true
    }
    
    func getVisaPreference() async throws -> SyncOrderRequest {
        // TODO: Implementar obtención de preferencia Visa
        SyncOrderRequest(shoppingCartId: nil, purchaseNumber: nil)
    }
    
    func clearVisaPreference() async throws -> Bool {
        // TODO: Implementar limpieza de preferencia Visa
        true
    }
    
    func saveContentConfig(contentConfig: ContentConfig) async throws -> Bool {
        // TODO: Implementar guardado de ContentConfig
        true
    }
    
    func getContentConfig() async throws -> ContentConfig {
        // TODO: Implementar obtención de ContentConfig
        // Por ahora retorna valores por defecto
        ContentConfig(
            defaultZoomForMap: 15,
            messageForDirectSearch: "",
            thereIsNoStoreWithStock: "",
            delayForPredictiveAddresses: 0,
            messageForRequiredGeolocation: "",
            suggestedMessageForPredictiveAddresses: "",
            minimunCharactersForPredictiveAddresses: 0,
            tagRet: ""
        )
    }
    
    func saveBusinessContentConfig(contentConfig: CardConfiguration) async throws -> CardConfiguration {
        // TODO: Implementar guardado de CardConfiguration
        contentConfig
    }
    
    func saveOmnicanalContentConfig(contentConfig: OmnicanalConfiguration) async throws -> OmnicanalConfiguration {
        // TODO: Implementar guardado de OmnicanalConfiguration
        contentConfig
    }
    
    func getBusinessContentConfig() -> CardConfiguration {
        // TODO: Implementar obtención de CardConfiguration
        CardConfiguration(cardsAssociatedDefault: nil, cardsAssociated: nil)
    }
    
    func getOmnicanalContentConfig() -> OmnicanalConfiguration {
        // TODO: Implementar obtención de OmnicanalConfiguration
        OmnicanalConfiguration(
            quantity: nil,
            statusModal: nil,
            title: nil,
            imageUrl: nil,
            text: nil,
            button: nil
        )
    }
}
