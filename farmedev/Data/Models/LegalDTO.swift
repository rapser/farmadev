//
//  LegalDTO.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

struct LegalDTO: Codable {
    let id: String?
    let titulo: String?
    let descripcion: String?
    let lista: [LegalDTO]?
}
