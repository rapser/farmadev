//
//  VoucherCompanyUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

extension VoucherCompany {

    func toUI() -> VoucherCompanyUI {
        VoucherCompanyUI(
            id: id,
            name: name,
            address: address
        )
    }
}
