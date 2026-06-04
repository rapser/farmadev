//
//  ReferedCloudDataStore.swift
//  farmedev
//
//  Created by miguel tomairo on 24/01/26.
//

import Foundation

final class ReferedCloudDataStore: ReferedDataStore {
    
    func addCode(request: PromoCodeRequest) async throws -> DiscountCodeDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "ReferedCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getReferedUser(filter: String, coupon: String) async throws -> DiscountReferedUserDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "ReferedCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
    
    func getDiscountUser(request: ReferedCodeRequest) async throws -> DiscountCodeUserDTO {
        // TODO: Implementar llamada a API
        throw NSError(domain: "ReferedCloudDataStore", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not implemented"])
    }
}
