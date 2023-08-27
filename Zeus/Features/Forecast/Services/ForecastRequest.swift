//
//  ForecastRequest.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

public enum ForecastRequest: NetworkRequest {
    case daily(lat: Double, lon: Double)
    
    public var baseURL: URL? {
        URL(string: Environment.baseURL)
    }
    
    public var path: String {
        switch self {
        case .daily:
            return "/data/2.5/forecast"
        }
    }
    
    public var method: RequestMethod {
        switch self {
        case .daily:
            return .GET
        }
    }
    
    public var queryParams: [String : Any]? {
        switch self {
        case .daily(let lat, let lon):
            return [
                "lat": "\(lat)",
                "lon": "\(lon)",
                "cnt": "27",
                "lang": "en",
                "appid": Environment.apiKey,
            ]
        }
    }
}
