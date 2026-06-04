//
//  UserLocalDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class UserLocalDataStore: UserDataStore {
    
    private let userDefaults = UserDefaults.standard
    
    func saveInstanceToken(requestToken: NotificationTokenRequest) async throws -> EmptyDTO {
        userDefaults.set(requestToken.notificationToken, forKey: "notification_token")
        return EmptyDTO()
    }
    
    func getUser(forPhoneNumber phoneNumber: String) async throws -> UserDTO {
        // TODO: Implementar lectura desde UserDefaults o CoreData
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getUserV2(uid: String, phone: String) async throws -> UserResponseDTO {
        // TODO: Implementar
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getUserV2WithEmail(uid: String, email: String, userSessionFlag: Bool) async throws -> UserResponseDTO {
        // TODO: Implementar
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getUserV2WithUuid(uid: String, userSessionFlag: Bool) async throws -> UserResponseDTO {
        // TODO: Implementar
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getUserV2FromCoinpurse(docNumber: String) async throws -> UserResponseDTO {
        // TODO: Implementar
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func updateUser(user: UpdateUserResponseDTO) async throws -> UpdateUserResponseDTO {
        // Guardar usuario en UserDefaults
        if let data = try? JSONEncoder().encode(user) {
            userDefaults.set(data, forKey: "user_data")
        }
        return user
    }
    
    func updateUserRequest(user: UpdateUserRequestValues) async throws -> UpdateUserResponseDTO {
        // TODO: Implementar
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func deleteNotificationToken() async throws -> EmptyDTO {
        userDefaults.removeObject(forKey: "notification_token")
        return EmptyDTO()
    }
    
    func getUser() async throws -> UserDTO {
        guard let data = userDefaults.data(forKey: "user_data"),
              let userDTO = try? JSONDecoder().decode(UserDTO.self, from: data) else {
            throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not found"])
        }
        return userDTO
    }
    
    func addOrUpdate(request: AddressItem) async throws -> AddressResponseDTO {
        // TODO: Implementar
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func coverageLocation(latitude: Double, longitude: Double) async throws -> CoverageLocationDTO {
        // TODO: Implementar
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func deleteAddress(idAddress: Int) async throws -> EmptyDTO {
        // TODO: Implementar
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func updateFavoriteAddress(idAddress: Int) async throws -> EmptyDTO {
        // TODO: Implementar
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func geocoding(address: String) async throws -> GeocodingResponseDTO {
        // TODO: Implementar
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func updateProfile(request: UserRequest) async throws -> EmptyDTO {
        // TODO: Implementar
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getDocumentsTypes() async throws -> [DocumentTypeDTO] {
        // TODO: Implementar
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func updateUserLegacy(request: UpdateUserLegacyRequest) async throws -> EmptyDTO {
        // TODO: Implementar
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getCustomToken() async throws -> CustomTokenDTO {
        // TODO: Implementar
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func saveDataIncomplete(request: UserNotRegister) async throws -> EmptyDTO {
        // TODO: Implementar
        throw NSError(domain: "UserLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
}
