//
//  GeocodingResponseDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension GeocodingResponseDTO {
    func toDomain() -> GeocodingResponse {
        GeocodingResponse(
            results: results?.map { $0.toDomain() },
            status: status
        )
    }
}

extension GeocodingResponseDTO.GeocodingAddressDTO {
    func toDomain() -> GeocodingAddress {
        GeocodingAddress(
            address_components: address_components?.map { $0.toDomain() },
            formatted_address: formatted_address,
            geometry: geometry?.toDomain()
        )
    }
}

extension GeocodingResponseDTO.AddressComponentDTO {
    func toDomain() -> AddressComponent {
        AddressComponent(
            long_name: long_name,
            short_name: short_name,
            types: types
        )
    }
}

extension GeocodingResponseDTO.GeometryDTO {
    func toDomain() -> Geometry {
        Geometry(location: location?.toDomain())
    }
}

extension GeocodingResponseDTO.AddressLocationDTO {
    func toDomain() -> AddressLocation {
        AddressLocation(
            lat: lat,
            lng: lng
        )
    }
}
