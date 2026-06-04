//
//  PurchaseStatusRequest.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct PurchaseStatusRequest {
    let purchaseNumber: Int?
    let status: String?
    let actionDescription: String?
    let statusFilter: Int?
    let cardBrandId: Int?
    let cardBrandDescription: String?
    let cardIssuer: String?
}
