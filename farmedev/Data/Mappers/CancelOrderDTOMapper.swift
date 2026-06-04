//
//  CancelOrderDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CancelOrderDTO {

    func toDomain() -> CancelOrder {
        CancelOrder(
            isCancellable: isCancellable?.lowercased() == "true" || isCancellable == "1"
        )
    }
}
