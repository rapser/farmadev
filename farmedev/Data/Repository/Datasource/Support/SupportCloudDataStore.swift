//
//  SupportCloudDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SupportCloudDataStore: SupportDataStore {
    
    func getQuestions(id: String) async throws -> FaqModelDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "SupportCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getSections() async throws -> FaqSectionModelDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "SupportCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getDefaultContactMessages() async throws -> [Message] {
        // TODO: Implementar
        throw NSError(domain: "SupportCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
}
