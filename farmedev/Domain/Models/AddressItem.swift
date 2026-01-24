//
//  AddressItem.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct AddressItem {
    let id: Int
    let name: String
    let zoneId: Int
    let district: String
    let street: String
    let number: String
    let apartment: String
    let city: String
    let viaId: Int
    let note: String
    let latitude: Double
    let longitude: Double
    let favorite: Bool
    let scheduleMessage: ScheduleMessage?
    let schedule: Schedule?
    let addressMessage: AddressMessage?
    let canContinue: Bool
    let latitudeAux: Double
    let longitudeAux: Double
    let requireEdition: String
    let drugstoreAddress: DrugstoreAddress?
    let pickupAddress: String
    
    // Modelos auxiliares incluidos directamente
    struct Schedule {
        let day: [Day]
        let hour: [Hour]
    }
    
    struct AddressMessage {
        let text: String
        let image: String
    }
    
    struct Day {
        let id: Int
        let value: String
        let text: String
        let today: String
    }
    
    struct DrugstoreAddress {
        let id: Int
        let name: String
        let description: String
        let address: String
        let latitude: Double
        let longitude: Double
        let zones: Int
        let inkaVentaId: Int
        let localZones: String
        let ubigeo: String
        let maxCapacity: Int
        let currentCapacity: Int
        let localCode: Int
    }
}
