//
//  ForecastRequest.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation
import Core
import Network

public enum ForecastRequest: NetworkRequest {
    case forecast(query: String, days: Int = 3)
    
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
        let lang = Locale.current.language.languageCode?.identifier ?? "en"
        
        switch self {
        case .forecast(let query, let days):
            return [
                "q": "\(query)",
                "days": "\(days)",
                "aqi": "no",
                "alerts": "no",
                "lang": lang,
                "key": Environment.apiKey,
            ]
        }
    }
}
