//
//  Network.swift
//  Zeus
//
//  Created by Paul Matar on 26/08/2023.
//

import Foundation

public struct Network {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    public init(
        session: URLSession = .init(configuration: .default),
        decoder: JSONDecoder = .init()
    ) {
        self.session = session
        self.decoder = decoder
    }
}

// MARK: - Networking
extension Network: Networking {
    public func perform<T: Decodable>(_ request: some NetworkRequest) async throws -> T {
        guard NetworkStatus.isConnected else {
            throw NetworkError.noInternetConnection
        }
        
        let urlRequest = try buildURLRequest(from: request)
        
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.invalidServerResponse
        }
        
        log(response: response, data: data)
        
        try handleResponse(response)
        
        return try decoder.decode(T.self, from: data)
    }
    
    public func fetch(from url: URL) async throws -> Data {
        guard NetworkStatus.isConnected else {
            throw NetworkError.noInternetConnection
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.invalidServerResponse
        }
        
        log(response: response, data: data)
        
        try handleResponse(response)
        
        return data
    }
}

// MARK: - Private methods
extension Network {
    private func buildURLRequest(from request: NetworkRequest) throws -> URLRequest {
        guard let url = request.baseURL else {
            throw NetworkError.invalidURL
        }
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw NetworkError.invalidURL
        }
        
        components.path = request.path
        
        if let queryParams = request.queryParams {
            components.queryItems = queryParams.map { .init(name: $0.key, value: $0.value as? String) }
        }
        
        guard let requestURL = components.url else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(
            url: requestURL,
            cachePolicy: request.cachePolicy,
            timeoutInterval: request.timeoutInterval
        )
        
        urlRequest.httpMethod = request.method.rawValue
        
        if let contentType = request.contentType {
            urlRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
        }
        
        if let httpBody = try request.body.toHttpBody() {
            urlRequest.httpBody = httpBody
            urlRequest.setValue("\(httpBody.count)", forHTTPHeaderField: "Content-Length")
        }
        
        for (key, value) in request.headers {
            urlRequest.addValue(value.description, forHTTPHeaderField: key)
        }
        
        log(request: urlRequest)
        
        return urlRequest
    }
    
    private func handleResponse(_ response: HTTPURLResponse) throws {
        switch response.statusCode {
        case 200...299:
            break
        case 500...599:
            throw NetworkError.serverError
        case 400:
            throw NetworkError.badRequest
        case 401:
            throw NetworkError.unauthorized
        case 403:
            throw NetworkError.forbidden
        default:
            throw NetworkError.invalidServerResponseWithStatusCode(response.statusCode)
        }
    }
}

