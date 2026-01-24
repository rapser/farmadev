//
//  DeliveryInfoDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension DeliveryInfoDTO {

    func toDomain() -> DeliveryInfo {
        DeliveryInfo(
            address: address?.map { $0.toDomain() } ?? [],
            paymentMethods: paymentMethods?.map { $0.toDomain() } ?? [],
            zones: zones?.map { $0.toDomain() } ?? [],
            bannerCheckout: bannerCheckout?.map { $0.toDomain() } ?? [],
            deliveriesTypes: deliveriesTypes?.map { $0.toDomain() } ?? [],
            serviceTypes: serviceTypes?.map { $0.toDomain() } ?? [],
            isActiveThird: isActiveThird ?? false
        )
    }
}

extension DeliveryInfoDTO.ZonesDTO {
    func toDomain() -> DeliveryInfo.Zones {
        DeliveryInfo.Zones(
            id: id ?? 0,
            zoneLimits: zoneLimits?.map { $0.toDomain() } ?? []
        )
    }
}

extension DeliveryInfoDTO.BannerDTO {
    func toDomain() -> DeliveryInfo.Banner {
        DeliveryInfo.Banner(
            checkoutCart: checkoutCart ?? "",
            imageUrl: imageUrl ?? "",
            order: order ?? 0
        )
    }
}


extension DeliveryInfoDTO.LatLongDTO {
    func toDomain() -> DeliveryInfo.LatLong {
        DeliveryInfo.LatLong(
            latitude: latitude ?? 0,
            longitude: longitude ?? 0
        )
    }
}

extension DeliveryInfoDTO.DrugstoreAddressDTO {
    func toDomain() -> DeliveryInfo.DrugstoreAddress {
        DeliveryInfo.DrugstoreAddress(
            id: id ?? 0,
            name: name ?? "",
            description: description ?? "",
            address: address ?? "",
            latitude: latitude ?? 0,
            longitude: longitude ?? 0,
            zones: zones ?? 0,
            inkaVentaId: inkaVentaId ?? 0,
            localZones: localZones ?? "",
            ubigeo: ubigeo ?? "",
            maxCapacity: maxCapacity ?? 0,
            currentCapacity: currentCapacity ?? 0,
            localCode: localCode ?? 0
        )
    }
}
