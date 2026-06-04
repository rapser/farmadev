//
//  UserUseCase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class UserUseCase {
    
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func getAndSaveInstanceToken() async throws -> Bool {
        try await userRepository.getAndSaveInstanceToken()
    }
    
    func getUserFromSavedPhoneNumber() async throws -> User {
        try await userRepository.getUserFromSavedPhoneNumber()
    }
    
    func getUserV2() async throws -> UserResponse {
        try await userRepository.getUserV2()
    }
    
    func getUserV2WithEmail(email: String, userSessionFlag: Bool) async throws -> UserResponse {
        try await userRepository.getUserV2WithEmail(email: email, userSessionFlag: userSessionFlag)
    }
    
    func getUserV2WithUuid(userSessionFlag: Bool) async throws -> UserResponse {
        try await userRepository.getUserV2WithUuid(userSessionFlag: userSessionFlag)
    }
    
    func getUserV2FromCoinpurse(docNumber: String) async throws -> UserResponse {
        try await userRepository.getUserV2FromCoinpurse(docNumber: docNumber)
    }
    
    func updateUserForSavedPhoneNumber(_ userInfo: UpdateUserRequestValues) async throws -> UpdateUserResponse {
        try await userRepository.updateUserForSavedPhoneNumber(user: userInfo)
    }
    
    func saveUserFromUserV2(userEntity: UpdateUserResponse) async throws -> UpdateUserResponse {
        try await userRepository.saveUserFromUserV2(userEntity: userEntity)
    }
    
    func deleteNotificationToken() async throws -> Bool {
        try await userRepository.deleteNotificationToken()
    }
    
    func getUserLocal() async throws -> User {
        try await userRepository.getUserLocal()
    }
    
    func getUser() async throws -> User {
        try await userRepository.getUser()
    }
    
    func addOrUpdate(request: AddressItem) async throws -> AddressResponse {
        try await userRepository.addOrUpdate(request: request)
    }
    
    func coverageLocation(latitude: Double, longitude: Double) async throws -> CoverageLocation {
        try await userRepository.coverageLocation(latitude: latitude, longitude: longitude)
    }
    
    func deleteAddress(idAddress: Int) async throws -> Bool {
        try await userRepository.deleteAddress(idAddress: idAddress)
    }
    
    func updateFavoriteAddress(idAddress: Int) async throws -> Bool {
        try await userRepository.updateFavoriteAddress(idAddress: idAddress)
    }
    
    func geocoding(address: String) async throws -> GeocodingResponse {
        try await userRepository.geocoding(address: address)
    }
    
    func updateProfile(request: UserRequest) async throws -> Bool {
        try await userRepository.updateProfile(request: request)
    }
    
    func getDocumentsTypes() async throws -> [DocumentType] {
        try await userRepository.getDocumentsTypes()
    }
    
    func updateUserLegacy(request: UpdateUserLegacyRequest) async throws -> Bool {
        try await userRepository.updateUserLegacy(request: request)
    }
    
    func getCustomToken() async throws -> CustomToken {
        try await userRepository.getCustomToken()
    }
    
    func saveDataIncomplete(request: UserNotRegister) async throws -> Bool {
        try await userRepository.saveDataIncomplete(request: request)
    }
}
