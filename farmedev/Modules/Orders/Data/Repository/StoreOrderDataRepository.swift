//
//  StoreOrderDataRepository.swift
//  farmedev
//

import Foundation

final class StoreOrderDataRepository: StoreOrderRepository {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClientFactory.shared.client) {
        self.apiClient = apiClient
    }

    func createOrder(addressLine: String, district: String, reference: String?, paymentMethod: String) async throws -> StoreOrder {
        struct Body: Encodable { let addressLine, district: String; let reference: String?; let paymentMethod: String }
        let body = try JSONEncoder().encode(Body(addressLine: addressLine, district: district, reference: reference, paymentMethod: paymentMethod))
        let dto: StoreOrderDTO = try await apiClient.request(path: "orders", method: .post, body: body, queryItems: nil)
        return dto.toDomain()
    }

    func getOrders(page: Int, limit: Int) async throws -> Paginated<StoreOrder> {
        let items: [URLQueryItem] = [URLQueryItem(name: "page", value: String(page)), URLQueryItem(name: "limit", value: String(limit))]
        let dto: PaginatedDTO<StoreOrderDTO> = try await apiClient.request(path: "orders", method: .get, body: nil, queryItems: items)
        return Paginated(items: dto.items.map { $0.toDomain() }, total: dto.total, page: dto.page, limit: dto.limit)
    }

    func getOrder(id: String) async throws -> StoreOrder {
        let dto: StoreOrderDTO = try await apiClient.request(path: "orders/\(id)", method: .get, body: nil, queryItems: nil)
        return dto.toDomain()
    }
}
