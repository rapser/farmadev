//
//  ShippingAddress.swift
//  farmedev
//

import Foundation

struct ShippingAddress: Identifiable, Equatable {
    let id: String
    let label: String
    let addressLine: String
    let reference: String?
    let district: String
    let latitude: Double?
    let longitude: Double?
    let isDefault: Bool
}
