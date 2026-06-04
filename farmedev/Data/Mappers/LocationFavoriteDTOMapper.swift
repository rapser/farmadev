//
//  LocationFavoriteDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension LocationFavoriteDTO {

    func toDomain() -> LocationFavorite {
        LocationFavorite(
            addressName: addressName ?? "",
            addressNumber: addressNumber ?? "",
            drugstoreStockId: drugstoreStockId ?? "",
            inCoverage: inCoverage ?? false,
            enabled: enabled ?? false,
            latitude: latitude ?? 0,
            longitude: longitude ?? 0,
            zoneId: zoneId ?? 0,
            isFarFromCurrentLocation: isFarFromCurrentLocation ?? false
        )
    }
}
