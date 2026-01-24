//
//  AntifraudInfoUIMapper.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

extension AntifraudInfo {

    func toUI() -> AntifraudInfoUI {
        AntifraudInfoUI(
            fullName: "\(name) \(lastname)".trimmingCharacters(in: .whitespaces),
            email: email,
            phone: phoneNumber,
            address: address,
            amount: String(format: "%.2f", amount),
            date: dateCreated
        )
    }
}
