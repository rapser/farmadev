//
//  ShippingAddressUseCase.swift
//  farmedev
//

import Foundation

final class ShippingAddressUseCase {
    private let repository: ShippingAddressRepository

    init(repository: ShippingAddressRepository = ShippingAddressDataRepository()) {
        self.repository = repository
    }

    func list() async throws -> [ShippingAddress] {
        try await repository.list()
    }

    func create(label: String, addressLine: String, reference: String?, district: String, latitude: Double?, longitude: Double?, isDefault: Bool) async throws -> ShippingAddress {
        try await repository.create(label: label, addressLine: addressLine, reference: reference, district: district, latitude: latitude, longitude: longitude, isDefault: isDefault)
    }

    func delete(id: String) async throws {
        try await repository.delete(id: id)
    }
}
