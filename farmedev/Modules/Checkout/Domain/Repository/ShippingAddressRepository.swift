//
//  ShippingAddressRepository.swift
//  farmedev
//

import Foundation

protocol ShippingAddressRepository {
    func list() async throws -> [ShippingAddress]
    func create(label: String, addressLine: String, reference: String?, district: String, latitude: Double?, longitude: Double?, isDefault: Bool) async throws -> ShippingAddress
    func delete(id: String) async throws
}
