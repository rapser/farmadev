//
//  GeocodingResponseDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct GeocodingResponseDTO: Codable {
    let results: [GeocodingAddressDTO]?
    let status: String?
    
    struct GeocodingAddressDTO: Codable {
        let address_components: [AddressComponentDTO]?
        let formatted_address: String?
        let geometry: GeometryDTO?
    }
    
    struct AddressComponentDTO: Codable {
        let long_name: String?
        let short_name: String?
        let types: [String]?
    }
    
    struct GeometryDTO: Codable {
        let location: AddressLocationDTO?
    }
    
    struct AddressLocationDTO: Codable {
        let lat: Double?
        let lng: Double?
    }
}
