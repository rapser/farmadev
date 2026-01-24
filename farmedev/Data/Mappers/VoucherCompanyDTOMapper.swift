//
//  VoucherCompanyDTOMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension VoucherCompanyDTO {

    func toDomain() -> VoucherCompany {
        VoucherCompany(
            name: name ?? "",
            address: address ?? "",
            id: id ?? ""
        )
    }
}
