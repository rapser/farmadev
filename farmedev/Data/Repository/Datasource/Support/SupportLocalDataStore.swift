//
//  SupportLocalDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SupportLocalDataStore: SupportDataStore {
    
    func getQuestions(id: String) async throws -> FaqModelDTO {
        // TODO: Implementar lectura desde UserDefaults o CoreData
        throw NSError(domain: "SupportLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getSections() async throws -> FaqSectionModelDTO {
        // TODO: Implementar
        throw NSError(domain: "SupportLocalDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getDefaultContactMessages() async throws -> [Message] {
        // Retornar mensajes por defecto hardcodeados
        return [
            Message(
                id: 1,
                includeOrderNumber: true,
                title: "Consulta sobre pedido",
                subject: "Consulta",
                body: "Tengo una consulta sobre mi pedido"
            ),
            Message(
                id: 2,
                includeOrderNumber: false,
                title: "Problema con la aplicación",
                subject: "Problema técnico",
                body: "Estoy teniendo problemas con la aplicación"
            ),
            Message(
                id: 3,
                includeOrderNumber: false,
                title: "Sugerencia",
                subject: "Sugerencia",
                body: "Tengo una sugerencia para mejorar la aplicación"
            )
        ]
    }
}
