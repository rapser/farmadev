//
//  CancelReasonDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension CancelReasonDTO {

    func toDomain() -> CancelReason {
        CancelReason(
            id: id ?? "",
            reason: reason ?? ""
        )
    }
}
