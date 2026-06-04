//
//  SupportDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

protocol SupportDataStore {
    func getQuestions(id: String) async throws -> FaqModelDTO
    func getSections() async throws -> FaqSectionModelDTO
    func getDefaultContactMessages() async throws -> [Message]
}
