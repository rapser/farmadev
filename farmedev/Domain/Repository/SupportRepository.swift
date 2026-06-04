//
//  SupportRepository.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol SupportRepository {
    func getQuestions(id: String) async throws -> FaqModel
    
    func getSections() async throws -> FaqSectionModel
    
    func getDefaultContactMessages() async throws -> [Message]
}
