//
//  NetworkRequest.swift
//  Zeus
//
//  Created by Paul Matar on 26/08/2023.
//

import Foundation

public protocol NetworkRequest {
    var baseURL: URL? { get }
    var path: String { get }
    var method: RequestMethod { get }
    var queryParams: [String: Any]? { get }
    var body: RequestBody { get }
    var contentType: String? { get }
    var headers: [String: LosslessStringConvertible] { get }
    var timeoutInterval: Double { get }
    var cachePolicy: URLRequest.CachePolicy { get }
}

/// Default values
public extension NetworkRequest {
    var queryParams: [String: Any]? {
        nil
    }
    
    var body: RequestBody {
        .none
    }
    
    var contentType: String? {
        nil
    }
    
    var headers: [String: LosslessStringConvertible] {
        [:]
    }
    
    var timeoutInterval: Double {
        60
    }
    
    var cachePolicy: URLRequest.CachePolicy {
        .reloadIgnoringLocalAndRemoteCacheData
    }
}
