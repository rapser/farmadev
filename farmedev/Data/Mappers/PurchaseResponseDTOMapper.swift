//
//  PurchaseResponseDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension PurchaseResponseDTO {
    func toDomain() -> PurchaseResponse {
        PurchaseResponse(purchaseNumber: purchaseNumber)
    }
}
