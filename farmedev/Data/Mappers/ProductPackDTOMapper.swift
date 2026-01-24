//
//  ProductPackDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension ProductPackDTO {

    func toDomain() -> ProductPack {
        ProductPack(
            product: product?.toDomain(),
            lam: lam?.toDomain()
        )
    }
}
