//
//  CurrencyFormatting.swift
//  farmedev
//

import Foundation

enum CurrencyFormatting {
    static func soles(_ amount: Double) -> String {
        String(format: "S/ %.2f", amount)
    }
}
