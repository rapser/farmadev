//
//  CancelListOrderDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CancelListOrderDTO {

    func toDomain() -> CancelListOrder {
        CancelListOrder(
            cancelReasons: cancelReasons?.map { $0.toDomain() } ?? []
        )
    }
}
