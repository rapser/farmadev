//
//  UserRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol UserRepository {
    func getAndSaveInstanceToken() async throws -> Bool
    
    func getUserFromSavedPhoneNumber() async throws -> User
    
    func getUserV2() async throws -> UserResponse
    
    func getUserV2WithEmail(email: String, userSessionFlag: Bool) async throws -> UserResponse
    
    func getUserV2WithUuid(userSessionFlag: Bool) async throws -> UserResponse
    
    func getUserV2FromCoinpurse(docNumber: String) async throws -> UserResponse
    
    func updateUserForSavedPhoneNumber(user: UpdateUserRequestValues) async throws -> UpdateUserResponse
    
    func saveUserFromUserV2(userEntity: UpdateUserResponse) async throws -> UpdateUserResponse
    
    func deleteNotificationToken() async throws -> Bool
    
    func getUserLocal() async throws -> User
    
    func getUser() async throws -> User
    
    func addOrUpdate(request: AddressItem) async throws -> AddressResponse
    
    func coverageLocation(latitude: Double, longitude: Double) async throws -> CoverageLocation
    
    func deleteAddress(idAddress: Int) async throws -> Bool
    
    func updateFavoriteAddress(idAddress: Int) async throws -> Bool
    
    func geocoding(address: String) async throws -> GeocodingResponse
    
    func updateProfile(request: UserRequest) async throws -> Bool
    
    func getDocumentsTypes() async throws -> [DocumentType]
    
    func updateUserLegacy(request: UpdateUserLegacyRequest) async throws -> Bool
    
    func getCustomToken() async throws -> CustomToken
    
    func saveDataIncomplete(request: UserNotRegister) async throws -> Bool
}
