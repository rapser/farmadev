//
//  NearDrugstoreRequest.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct NearDrugstoreRequest {
    let latitude: Double?
    let longitude: Double?
    let shoppingCart: [CartProduct]?
}

struct CartProduct {
    let productId: String
    let quantity: Int
    let presentationIdSelected: Int
    let fractionatedFormSelect: String
}
