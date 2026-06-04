//
//  UserDataRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class UserDataRepository: UserRepository {
    
    private let userDataStoreFactory: UserDataStoreFactory
    private let configDataStoreFactory: ConfigDataStoreFactory
    private let authDataStoreFactory: AuthDataStoreFactory
    
    init(userDataStoreFactory: UserDataStoreFactory, configDataStoreFactory: ConfigDataStoreFactory, authDataStoreFactory: AuthDataStoreFactory) {
        self.userDataStoreFactory = userDataStoreFactory
        self.configDataStoreFactory = configDataStoreFactory
        self.authDataStoreFactory = authDataStoreFactory
    }
    
    func getAndSaveInstanceToken() async throws -> Bool {
        let authDataStore = authDataStoreFactory.createFirebase()
        let cloudUserDataStore = userDataStoreFactory.createCloud()
        let localUserDataStore = userDataStoreFactory.createLocal()
        
        let instanceToken = try await authDataStore.getInstanceToken()
        let requestToken = NotificationTokenRequest(notificationToken: instanceToken)
        
        _ = try await cloudUserDataStore.saveInstanceToken(requestToken: requestToken)
        _ = try await localUserDataStore.saveInstanceToken(requestToken: requestToken)
        
        return true
    }
    
    func getUserFromSavedPhoneNumber() async throws -> User {
        let configDataStore = configDataStoreFactory.createLocal()
        let userDataStore = userDataStoreFactory.createCloud()
        
        let phoneNumber = try await configDataStore.getSavedPhoneNumber()
        let userDTO = try await userDataStore.getUser(forPhoneNumber: phoneNumber)
        return userDTO.toDomain()
    }
    
    func getUserV2() async throws -> UserResponse {
        let authDataStore = authDataStoreFactory.createFirebase()
        let userDataStore = userDataStoreFactory.createCloud()
        let configDataStore = configDataStoreFactory.createLocal()
        
        let uid = try await authDataStore.getUID()
        let phoneNumber = try await configDataStore.getSavedPhoneNumber()
        let userResponseDTO = try await userDataStore.getUserV2(uid: uid, phone: phoneNumber)
        return userResponseDTO.toDomain()
    }
    
    func getUserV2WithEmail(email: String, userSessionFlag: Bool) async throws -> UserResponse {
        let authDataStore = authDataStoreFactory.createFirebase()
        let userDataStore = userDataStoreFactory.createCloud()
        
        let uid = try await authDataStore.getUID()
        let userResponseDTO = try await userDataStore.getUserV2WithEmail(uid: uid, email: email, userSessionFlag: userSessionFlag)
        return userResponseDTO.toDomain()
    }
    
    func getUserV2WithUuid(userSessionFlag: Bool) async throws -> UserResponse {
        let authDataStore = authDataStoreFactory.createFirebase()
        let userDataStore = userDataStoreFactory.createCloud()
        
        let uid = try await authDataStore.getUID()
        let userResponseDTO = try await userDataStore.getUserV2WithUuid(uid: uid, userSessionFlag: userSessionFlag)
        return userResponseDTO.toDomain()
    }
    
    func getUserV2FromCoinpurse(docNumber: String) async throws -> UserResponse {
        let userDataStore = userDataStoreFactory.createCloud()
        let userResponseDTO = try await userDataStore.getUserV2FromCoinpurse(docNumber: docNumber)
        return userResponseDTO.toDomain()
    }
    
    func updateUserForSavedPhoneNumber(user: UpdateUserRequestValues) async throws -> UpdateUserResponse {
        let configDataStore = configDataStoreFactory.createLocal()
        let cloudUserDataStore = userDataStoreFactory.createCloud()
        let localUserDataStore = userDataStoreFactory.createLocal()
        
        let phoneNumber = try await configDataStore.getSavedPhoneNumber()
        // Si no tiene phone, usar el guardado
        let updatingUser = UpdateUserRequestValues(
            name: user.name,
            email: user.email,
            birthDate: user.birthDate,
            sexId: user.sexId,
            identityDocumentType: user.identityDocumentType,
            identityDocumentNumber: user.identityDocumentNumber,
            paternalLastName: user.paternalLastName,
            maternalLastName: user.maternalLastName,
            campaignId: user.campaignId,
            flagTermsAndConditions: user.flagTermsAndConditions,
            flagPrivacyPolicy: user.flagPrivacyPolicy,
            flagDataTreatment: user.flagDataTreatment,
            newUserId: user.newUserId,
            photo: user.photo,
            photoExtension: user.photoExtension,
            phone: user.phone ?? phoneNumber
        )
        
        let updateUserResponseDTO = try await cloudUserDataStore.updateUserRequest(user: updatingUser)
        let savedUserDTO = try await localUserDataStore.updateUser(user: updateUserResponseDTO)
        return savedUserDTO.toDomain()
    }
    
    func saveUserFromUserV2(userEntity: UpdateUserResponse) async throws -> UpdateUserResponse {
        let localUserDataStore = userDataStoreFactory.createLocal()
        // Convertir UpdateUserResponse a UpdateUserResponseDTO
        let userDTO = UpdateUserResponseDTO(
            phone: userEntity.phone,
            email: userEntity.email,
            name: userEntity.name,
            isAnonymous: userEntity.isAnonymous,
            companyId: userEntity.companyId,
            authId: userEntity.authId,
            id: userEntity.id,
            uids: userEntity.uids,
            authUserId: userEntity.authUserId,
            encryptedDni: userEntity.encryptedDni,
            encryptedEmail: userEntity.encryptedEmail,
            intercorp: userEntity.intercorp,
            anonymous: userEntity.anonymous,
            identityDocumentType: userEntity.identityDocumentType,
            identityDocumentNumber: userEntity.identityDocumentNumber,
            paternalLastName: userEntity.paternalLastName,
            maternalLastName: userEntity.maternalLastName,
            birthDate: userEntity.birthDate,
            sexId: userEntity.sexId,
            inkaclubRegistrationStatus: userEntity.inkaclubRegistrationStatus != nil ? UpdateUserResponseDTO.InkaclubRegistrationStatusDTO(
                code: userEntity.inkaclubRegistrationStatus!.code,
                status: userEntity.inkaclubRegistrationStatus!.status,
                description: userEntity.inkaclubRegistrationStatus!.description
            ) : nil
        )
        let savedUserDTO = try await localUserDataStore.updateUser(user: userDTO)
        return savedUserDTO.toDomain()
    }
    
    func deleteNotificationToken() async throws -> Bool {
        let userDataStore = userDataStoreFactory.createCloud()
        _ = try await userDataStore.deleteNotificationToken()
        return true
    }
    
    func getUserLocal() async throws -> User {
        let localUserDataStore = userDataStoreFactory.createLocal()
        let userDTO = try await localUserDataStore.getUser()
        return userDTO.toDomain()
    }
    
    func getUser() async throws -> User {
        let cloudUserDataStore = userDataStoreFactory.createCloud()
        let userDTO = try await cloudUserDataStore.getUser()
        return userDTO.toDomain()
    }
    
    func addOrUpdate(request: AddressItem) async throws -> AddressResponse {
        let userDataStore = userDataStoreFactory.createCloud()
        let addressResponseDTO = try await userDataStore.addOrUpdate(request: request)
        return addressResponseDTO.toDomain()
    }
    
    func coverageLocation(latitude: Double, longitude: Double) async throws -> CoverageLocation {
        let cloudDataStore = userDataStoreFactory.createCloud()
        let coverageLocationDTO = try await cloudDataStore.coverageLocation(latitude: latitude, longitude: longitude)
        return coverageLocationDTO.toDomain()
    }
    
    func deleteAddress(idAddress: Int) async throws -> Bool {
        let cloudDataStore = userDataStoreFactory.createCloud()
        _ = try await cloudDataStore.deleteAddress(idAddress: idAddress)
        return true
    }
    
    func updateFavoriteAddress(idAddress: Int) async throws -> Bool {
        let cloudDataStore = userDataStoreFactory.createCloud()
        _ = try await cloudDataStore.updateFavoriteAddress(idAddress: idAddress)
        return true
    }
    
    func geocoding(address: String) async throws -> GeocodingResponse {
        let cloudDataStore = userDataStoreFactory.createCloud()
        let geocodingResponseDTO = try await cloudDataStore.geocoding(address: address)
        return geocodingResponseDTO.toDomain()
    }
    
    func updateProfile(request: UserRequest) async throws -> Bool {
        let cloudDataStore = userDataStoreFactory.createCloud()
        _ = try await cloudDataStore.updateProfile(request: request)
        return true
    }
    
    func getDocumentsTypes() async throws -> [DocumentType] {
        let cloudDataStore = userDataStoreFactory.createCloud()
        let documentTypeDTOs = try await cloudDataStore.getDocumentsTypes()
        return documentTypeDTOs.map { $0.toDomain() }
    }
    
    func updateUserLegacy(request: UpdateUserLegacyRequest) async throws -> Bool {
        let authDataStore = authDataStoreFactory.createFirebase()
        let cloudDataStore = userDataStoreFactory.createCloud()
        
        let uid = try await authDataStore.getUID()
        let requestUpdate = request
        // UpdateUserLegacyRequest no tiene authId mutable, necesitamos crear uno nuevo
        let requestWithUid = UpdateUserLegacyRequest(
            companyId: requestUpdate.companyId,
            authId: uid,
            id: requestUpdate.id
        )
        _ = try await cloudDataStore.updateUserLegacy(request: requestWithUid)
        return true
    }
    
    func getCustomToken() async throws -> CustomToken {
        let userDataStore = userDataStoreFactory.createCloud()
        let customTokenDTO = try await userDataStore.getCustomToken()
        return customTokenDTO.toDomain()
    }
    
    func saveDataIncomplete(request: UserNotRegister) async throws -> Bool {
        let userDataStore = userDataStoreFactory.createCloud()
        _ = try await userDataStore.saveDataIncomplete(request: request)
        return true
    }
}
