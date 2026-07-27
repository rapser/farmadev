//
//  ShippingAddressDataRepository.swift
//  farmedev
//

import Foundation

final class ShippingAddressDataRepository: ShippingAddressRepository {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClientFactory.shared.client) {
        self.apiClient = apiClient
    }

    func list() async throws -> [ShippingAddress] {
        let dtos: [ShippingAddressDTO] = try await apiClient.request(path: "users/me/addresses", method: .get, body: nil, queryItems: nil)
        return dtos.map { $0.toDomain() }
    }

    func create(label: String, addressLine: String, reference: String?, district: String, latitude: Double?, longitude: Double?, isDefault: Bool) async throws -> ShippingAddress {
        struct Body: Encodable {
            let label, addressLine: String
            let reference: String?
            let district: String
            let latitude, longitude: Double?
            let isDefault: Bool
        }
        let body = try JSONEncoder().encode(Body(label: label, addressLine: addressLine, reference: reference, district: district, latitude: latitude, longitude: longitude, isDefault: isDefault))
        let dto: ShippingAddressDTO = try await apiClient.request(path: "users/me/addresses", method: .post, body: body, queryItems: nil)
        return dto.toDomain()
    }

    func delete(id: String) async throws {
        try await apiClient.requestVoid(path: "users/me/addresses/\(id)", method: .delete, body: nil, queryItems: nil)
    }
}
