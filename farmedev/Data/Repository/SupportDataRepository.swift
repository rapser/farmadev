//
//  SupportDataRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SupportDataRepository: SupportRepository {
    
    private let supportDataStoreFactory: SupportDataStoreFactory
    
    init(supportDataStoreFactory: SupportDataStoreFactory) {
        self.supportDataStoreFactory = supportDataStoreFactory
    }
    
    func getQuestions(id: String) async throws -> FaqModel {
        let cloudDataStore = supportDataStoreFactory.createCloud()
        let faqModelDTO = try await cloudDataStore.getQuestions(id: id)
        return faqModelDTO.toDomain()
    }
    
    func getSections() async throws -> FaqSectionModel {
        let cloudDataStore = supportDataStoreFactory.createCloud()
        let faqSectionModelDTO = try await cloudDataStore.getSections()
        return faqSectionModelDTO.toDomain()
    }
    
    func getDefaultContactMessages() async throws -> [Message] {
        let localDataStore = supportDataStoreFactory.createLocal()
        return try await localDataStore.getDefaultContactMessages()
    }
}
