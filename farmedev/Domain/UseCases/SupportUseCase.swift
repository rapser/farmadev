//
//  SupportUseCase.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SupportUseCase {
    
    private let supportRepository: SupportRepository

    init(supportRepository: SupportRepository) {
        self.supportRepository = supportRepository
    }
    
    func getQuestions(id: String) async throws -> FaqModel {
        try await supportRepository.getQuestions(id: id)
    }
    
    func getSections() async throws -> FaqSectionModel {
        try await supportRepository.getSections()
    }
    
    func getDefaultContactMessages() async throws -> [Message] {
        try await supportRepository.getDefaultContactMessages()
    }
}
