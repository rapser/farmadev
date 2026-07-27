//
//  ShippingAddressDTOMapper.swift
//  farmedev
//

import Foundation

extension ShippingAddressDTO {
    func toDomain() -> ShippingAddress {
        ShippingAddress(id: id, label: label, addressLine: addressLine, reference: reference, district: district, latitude: latitude, longitude: longitude, isDefault: isDefault)
    }
}
