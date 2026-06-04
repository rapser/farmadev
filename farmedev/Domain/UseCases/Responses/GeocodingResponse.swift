//
//  GeocodingResponse.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct GeocodingResponse {
    let results: [GeocodingAddress]?
    let status: String?
}

struct GeocodingAddress {
    let address_components: [AddressComponent]?
    let formatted_address: String?
    let geometry: Geometry?
}

struct AddressComponent {
    let long_name: String?
    let short_name: String?
    let types: [String]?
}

struct Geometry {
    let location: AddressLocation?
}

struct AddressLocation {
    let lat: Double?
    let lng: Double?
}
