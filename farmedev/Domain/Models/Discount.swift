//
//  Discount.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct Discount {
    let id: Int64
    let name: String
    let type: String
    let isEnable: String
    let parameters: [DiscountParameter]
    
    // Modelo auxiliar incluido directamente
    struct DiscountParameter {
        let name: String
        let value: String
    }
}
