//
//  AddressItemDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension AddressItemDTO {

    func toDomain() -> AddressItem {
        AddressItem(
            id: id ?? 0,
            name: name ?? "",
            zoneId: zoneId ?? 0,
            district: district ?? "",
            street: street ?? "",
            number: number ?? "",
            apartment: apartment ?? "",
            city: city ?? "",
            viaId: viaId ?? 0,
            note: note ?? "",
            latitude: latitude ?? 0,
            longitude: longitude ?? 0,
            favorite: favorite ?? false,
            scheduleMessage: scheduleMessage?.toDomain(),
            schedule: schedule?.toDomain(),
            addressMessage: addressMessage?.toDomain(),
            canContinue: canContinue ?? false,
            latitudeAux: latitudeAux ?? 0,
            longitudeAux: longitudeAux ?? 0,
            requireEdition: requireEdition ?? "",
            drugstoreAddress: drugstoreAddress?.toDomain(),
            pickupAddress: pickupAddress ?? ""
        )
    }
}

extension AddressItemDTO.ScheduleDTO {
    func toDomain() -> AddressItem.Schedule {
        AddressItem.Schedule(
            day: day?.map { $0.toDomain() } ?? [],
            hour: hour?.map { $0.toDomain() } ?? []
        )
    }
}

extension AddressItemDTO.AddressMessageDTO {
    func toDomain() -> AddressItem.AddressMessage {
        AddressItem.AddressMessage(
            text: text ?? "",
            image: image ?? ""
        )
    }
}

extension AddressItemDTO.DayDTO {
    func toDomain() -> AddressItem.Day {
        AddressItem.Day(
            id: id ?? 0,
            value: value ?? "",
            text: text ?? "",
            today: today ?? ""
        )
    }
}

extension AddressItemDTO.DrugstoreAddressDTO {
    func toDomain() -> AddressItem.DrugstoreAddress {
        AddressItem.DrugstoreAddress(
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
