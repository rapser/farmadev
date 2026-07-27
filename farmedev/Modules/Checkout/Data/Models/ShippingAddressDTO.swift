//
//  ShippingAddressDTO.swift
//  farmedev
//

import Foundation

struct ShippingAddressDTO: Decodable {
    let id: String
    let label: String
    let addressLine: String
    let reference: String?
    let district: String
    let latitude: Double?
    let longitude: Double?
    let isDefault: Bool
}
