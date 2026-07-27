//
//  AuthTokenInterceptor.swift
//  farmedev
//
//  Attaches the current access token to every request. On a 401, performs a single-flight
//  refresh against POST /auth/refresh using the stored refresh token, retries the original
//  request once with the new access token, and calls `onRefreshFailed` (wired to a forced
//  logout by AppState) if the refresh itself fails. This is the standard Alamofire pattern
//  for short-lived access tokens so call sites never have to think about expiry.
//

import Foundation
import Alamofire

final class AuthTokenInterceptor: RequestInterceptor, @unchecked Sendable {

    /// Called when a refresh attempt fails (refresh token missing, expired, or revoked) —
    /// the caller should treat this as a forced logout.
    var onRefreshFailed: (() -> Void)?

    private let lock = NSLock()
    private var accessToken: String?
    private var isRefreshing = false
    private var pendingRetries: [(RetryResult) -> Void] = []

    func setAccessToken(_ token: String?) {
        lock.lock()
        accessToken = token
        lock.unlock()
    }

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        lock.lock()
        let token = accessToken
        lock.unlock()

        if let token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        completion(.success(request))
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard
            let response = request.task?.response as? HTTPURLResponse,
            response.statusCode == 401,
            request.retryCount < 1
        else {
            completion(.doNotRetry)
            return
        }

        lock.lock()
        pendingRetries.append(completion)
        let shouldStartRefresh = !isRefreshing
        isRefreshing = true
        lock.unlock()

        guard shouldStartRefresh else { return }

        refreshAccessToken { [weak self] success in
            guard let self else { return }
            self.lock.lock()
            self.isRefreshing = false
            let waiting = self.pendingRetries
            self.pendingRetries = []
            self.lock.unlock()

            waiting.forEach { $0(success ? .retry : .doNotRetry) }
            if !success {
                self.onRefreshFailed?()
            }
        }
    }

    // MARK: - Private

    private struct RefreshRequestBody: Encodable {
        let refreshToken: String
    }

    private struct RefreshResponseBody: Decodable {
        let accessToken: String
        let refreshToken: String
    }

    private func refreshAccessToken(completion: @escaping (Bool) -> Void) {
        guard let refreshToken = SessionStore.loadRefreshToken() else {
            completion(false)
            return
        }

        var request = URLRequest(url: APIEnvironment.current.appendingPathComponent("auth/refresh"))
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(RefreshRequestBody(refreshToken: refreshToken))

        // Plain AF.request (no interceptor) to avoid recursive 401 handling.
        AF.request(request).validate().responseDecodable(of: RefreshResponseBody.self) { [weak self] response in
            switch response.result {
            case .success(let body):
                SessionStore.saveTokens(access: body.accessToken, refresh: body.refreshToken)
                self?.setAccessToken(body.accessToken)
                completion(true)
            case .failure:
                completion(false)
            }
        }
    }
}
