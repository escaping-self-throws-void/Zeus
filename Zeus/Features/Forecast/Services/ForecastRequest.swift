//
//  ForecastRequest.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

public enum ForecastRequest: NetworkRequest {
    case forecast(query: String, days: Int = 4)
    
    public var baseURL: URL? {
        URL(string: Environment.baseURL)
    }
    
    public var path: String {
        switch self {
        case .forecast:
            return "/v1/forecast.json"
        }
    }
    
    public var method: RequestMethod {
        switch self {
        case .forecast:
            return .GET
        }
    }
    
    public var queryParams: [String : Any]? {
        switch self {
        case .forecast(let query, let days):
            return [
                "q": "\(query)",
                "days": "\(days)",
                "lang": "en",
                "aqi": "no",
                "alerts": "no",
                "key": Environment.apiKey,
            ]
        }
    }
}