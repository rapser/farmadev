//
//  DeliveryInfoDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct DeliveryInfoDTO: Codable {
    let address: [AddressItemDTO]?
    let paymentMethods: [PaymentMethodDTO]?
    let zones: [ZonesDTO]?
    let bannerCheckout: [BannerDTO]?
    let deliveriesTypes: [DeliveriesTypesDTO]?
    let serviceTypes: [ServiceTypeDTO]?
    let isActiveThird: Bool?
    
    struct ZonesDTO: Codable {
        let id: Int?
        let zoneLimits: [LatLongDTO]?
    }
    
    struct BannerDTO: Codable {
        let checkoutCart: String?
        let imageUrl: String?
        let order: Int?
    }
    
    
    struct LatLongDTO: Codable {
        let latitude: Double?
        let longitude: Double?
    }
    
    struct DrugstoreAddressDTO: Codable {
        let id: Int?
        let name: String?
        let description: String?
        let address: String?
        let latitude: Double?
        let longitude: Double?
        let zones: Int?
        let inkaVentaId: Int?
        let localZones: String?
        let ubigeo: String?
        let maxCapacity: Int?
        let currentCapacity: Int?
        let localCode: Int?
    }
}
