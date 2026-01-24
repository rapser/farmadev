//
//  Address.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct Address {

    enum Names: String {
        case home = "Mi casa"
        case apartment = "Mi departamento"
        case work = "Mi trabajo"
        case office = "Mi oficina"
        case other = "Otro"
    }

    let id: Int
    let name: String
    let address: String
    let latitude: Double
    let longitude: Double

    static let allPredefinedNames: [String] = [
        Names.home.rawValue,
        Names.apartment.rawValue,
        Names.work.rawValue,
        Names.office.rawValue,
        Names.other.rawValue
    ]
}
