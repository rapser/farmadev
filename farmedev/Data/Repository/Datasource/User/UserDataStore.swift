//
//  UserDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol UserDataStore {
    func saveInstanceToken(requestToken: NotificationTokenRequest) async throws -> EmptyDTO
    func getUser(forPhoneNumber phoneNumber: String) async throws -> UserDTO
    func getUserV2(uid: String, phone: String) async throws -> UserResponseDTO
    func getUserV2WithEmail(uid: String, email: String, userSessionFlag: Bool) async throws -> UserResponseDTO
    func getUserV2WithUuid(uid: String, userSessionFlag: Bool) async throws -> UserResponseDTO
    func getUserV2FromCoinpurse(docNumber: String) async throws -> UserResponseDTO
    func updateUser(user: UpdateUserResponseDTO) async throws -> UpdateUserResponseDTO
    func updateUserRequest(user: UpdateUserRequestValues) async throws -> UpdateUserResponseDTO
    func deleteNotificationToken() async throws -> EmptyDTO
    func getUser() async throws -> UserDTO
    func addOrUpdate(request: AddressItem) async throws -> AddressResponseDTO
    func coverageLocation(latitude: Double, longitude: Double) async throws -> CoverageLocationDTO
    func deleteAddress(idAddress: Int) async throws -> EmptyDTO
    func updateFavoriteAddress(idAddress: Int) async throws -> EmptyDTO
    func geocoding(address: String) async throws -> GeocodingResponseDTO
    func updateProfile(request: UserRequest) async throws -> EmptyDTO
    func getDocumentsTypes() async throws -> [DocumentTypeDTO]
    func updateUserLegacy(request: UpdateUserLegacyRequest) async throws -> EmptyDTO
    func getCustomToken() async throws -> CustomTokenDTO
    func saveDataIncomplete(request: UserNotRegister) async throws -> EmptyDTO
}
