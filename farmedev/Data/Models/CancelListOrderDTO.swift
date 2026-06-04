//
//  CancelListOrderDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct CancelListOrderDTO: Codable {
    let cancelReasons: [CancelReasonDTO]?
}
