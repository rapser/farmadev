//
//  APIClient.swift
//  farmedev
//
//  Alamofire-backed implementation of APIClientProtocol. The protocol shape is kept
//  identical to the original URLSession-based client so every existing call site
//  (legacy Data/Repository/Datasource/**, and every new module's DataStores) keeps
//  compiling unchanged.
//

import Foundation
import Alamofire

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case httpStatus(Int, Data?)
    case server(status: Int, message: String)
    case decoding(Error)
    case underlying(Error)
}

protocol APIClientProtocol {
    func setAuthToken(_ token: String?)

    func request<T: Decodable>(
        path: String,
        method: HTTPMethod,
        body: Data?,
        queryItems: [URLQueryItem]?
    ) async throws -> T

    /// Fire-and-forget variant for endpoints that return no meaningful body (e.g. 204 No Content).
    func requestVoid(
        path: String,
        method: HTTPMethod,
        body: Data?,
        queryItems: [URLQueryItem]?
    ) async throws
}

/// Nest's default HttpException JSON shape: `{ statusCode, message, error }`, where `message`
/// is a plain string for most errors or a string array for class-validator field failures.
private struct NestErrorDTO: Decodable {
    let statusCode: Int
    let message: MessageField
    let error: String?

    enum MessageField: Decodable {
        case single(String)
        case multiple([String])

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(String.self) {
                self = .single(value)
            } else {
                self = .multiple(try container.decode([String].self))
            }
        }

        var joined: String {
            switch self {
            case .single(let value): return value
            case .multiple(let values): return values.joined(separator: "\n")
            }
        }
    }
}

final class APIClient: APIClientProtocol {

    private let baseURL: URL
    private let session: Session
    private let interceptor: AuthTokenInterceptor

    init(baseURL: URL = APIEnvironment.current, interceptor: AuthTokenInterceptor = AuthTokenInterceptor()) {
        self.baseURL = baseURL
        self.interceptor = interceptor

        #if DEBUG
        let logger = APIRequestLogger()
        self.session = Session(interceptor: interceptor, eventMonitors: [logger])
        #else
        self.session = Session(interceptor: interceptor)
        #endif
    }

    func setAuthToken(_ token: String?) {
        interceptor.setAccessToken(token)
    }

    func request<T: Decodable>(
        path: String,
        method: HTTPMethod = .get,
        body: Data? = nil,
        queryItems: [URLQueryItem]? = nil
    ) async throws -> T {
        let request = try makeRequest(path: path, method: method, body: body, queryItems: queryItems)

        do {
            return try await session.request(request)
                .validate()
                .serializingDecodable(T.self)
                .value
        } catch {
            throw try await mapError(error, request: request)
        }
    }

    func requestVoid(
        path: String,
        method: HTTPMethod = .get,
        body: Data? = nil,
        queryItems: [URLQueryItem]? = nil
    ) async throws {
        let request = try makeRequest(path: path, method: method, body: body, queryItems: queryItems)

        do {
            _ = try await session.request(request)
                .validate()
                .serializingData()
                .value
        } catch {
            throw try await mapError(error, request: request)
        }
    }

    // MARK: - Private

    private func makeRequest(
        path: String,
        method: HTTPMethod,
        body: Data?,
        queryItems: [URLQueryItem]?
    ) throws -> URLRequest {
        let pathSanitized = path.hasPrefix("/") ? String(path.dropFirst()) : path
        var components = URLComponents(url: baseURL.appendingPathComponent(pathSanitized), resolvingAgainstBaseURL: false)
        components?.queryItems = queryItems
        guard let url = components?.url else { throw APIError.invalidURL }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = body
        return request
    }

    private func mapError(_ error: Error, request: URLRequest) async throws -> APIError {
        guard
            let afError = error as? AFError,
            case let .responseValidationFailed(reason) = afError,
            case let .unacceptableStatusCode(code) = reason
        else {
            if case let .responseSerializationFailed(reason) = error as? AFError ?? .explicitlyCancelled,
               case .decodingFailed(let decodingError) = reason {
                return .decoding(decodingError)
            }
            return .underlying(error)
        }

        // Re-issue the request without validation to read the error body for a friendly message.
        let data = try? await session.request(request).serializingData().value
        if let data, let nestError = try? JSONDecoder().decode(NestErrorDTO.self, from: data) {
            return .server(status: code, message: nestError.message.joined)
        }
        return .httpStatus(code, data)
    }
}

/// DEBUG-only request/response logging.
final class APIRequestLogger: EventMonitor {
    func requestDidResume(_ request: Request) {
        print("➡️ [API] \(request.description)")
    }

    func request<Value>(_ request: DataRequest, didParseResponse response: AFDataResponse<Value>) {
        let status = response.response?.statusCode ?? -1
        print("⬅️ [API] \(status) \(request.description)")
    }
}
