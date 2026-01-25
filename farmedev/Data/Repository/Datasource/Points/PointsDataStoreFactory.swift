//
//  PointsDataStoreFactory.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class PointsDataStoreFactory {
    
    private init() { }
    
    static let shared = PointsDataStoreFactory()
    
    func createCloud() -> PointsDataStore {
        PointsCloudDataStore()
    }
}
