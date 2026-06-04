//
//  OrderListDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension OrderListDTO {

    func toDomain() -> OrderList {
        OrderList(
            orders: orders?.map { $0.toDomain() } ?? []
        )
    }
}
