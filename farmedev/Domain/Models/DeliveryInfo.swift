//
//  DeliveryInfo.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct DeliveryInfo {
    let address: [AddressItem]
    let paymentMethods: [PaymentMethod]
    let zones: [Zones]
    let bannerCheckout: [Banner]
    let deliveriesTypes: [DeliveriesTypes]
    let serviceTypes: [ServiceType]
    let isActiveThird: Bool
    
    struct Zones {
        let id: Int
        let zoneLimits: [LatLong]
    }
    
    struct Banner {
        let checkoutCart: String
        let imageUrl: String
        let order: Int
    }
    
    
    struct LatLong {
        let latitude: Double
        let longitude: Double
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
