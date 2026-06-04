//
//  SessionDataStoreFactory.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class SessionDataStoreFactory {
    
    private init() { }
    
    static let shared = SessionDataStoreFactory()
    
    func createLocal() -> SessionDataStore {
        SessionLocalDataStore()
    }
}
