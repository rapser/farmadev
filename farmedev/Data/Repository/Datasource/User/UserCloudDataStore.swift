//
//  UserCloudDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class UserCloudDataStore: UserDataStore {
    
    func saveInstanceToken(requestToken: NotificationTokenRequest) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getUser(forPhoneNumber phoneNumber: String) async throws -> UserDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getUserV2(uid: String, phone: String) async throws -> UserResponseDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getUserV2WithEmail(uid: String, email: String, userSessionFlag: Bool) async throws -> UserResponseDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getUserV2WithUuid(uid: String, userSessionFlag: Bool) async throws -> UserResponseDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getUserV2FromCoinpurse(docNumber: String) async throws -> UserResponseDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func updateUser(user: UpdateUserResponseDTO) async throws -> UpdateUserResponseDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func updateUserRequest(user: UpdateUserRequestValues) async throws -> UpdateUserResponseDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func deleteNotificationToken() async throws -> EmptyDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getUser() async throws -> UserDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func addOrUpdate(request: AddressItem) async throws -> AddressResponseDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func coverageLocation(latitude: Double, longitude: Double) async throws -> CoverageLocationDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func deleteAddress(idAddress: Int) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func updateFavoriteAddress(idAddress: Int) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func geocoding(address: String) async throws -> GeocodingResponseDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func updateProfile(request: UserRequest) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getDocumentsTypes() async throws -> [DocumentTypeDTO] {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func updateUserLegacy(request: UpdateUserLegacyRequest) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getCustomToken() async throws -> CustomTokenDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func saveDataIncomplete(request: UserNotRegister) async throws -> EmptyDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "UserCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
}
