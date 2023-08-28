//
//  Environment.swift
//  Zeus
//
//  Created by Paul Matar on 26/08/2023.
//

import Foundation

public enum Environment {
    private enum Keys {
        fileprivate enum Plist {
            static let baseURL = "BASE_URL"
            static let apiKey = "API_KEY"
        }
    }
    
    public static let baseURL: String = {
        if let baseURL = Bundle.main.object(forInfoDictionaryKey: Keys.Plist.baseURL) as? String {
            return "https://\(baseURL)"
        }
        return ""
    }()
    
    public static let apiKey: String = {
        if let apiKey = Bundle.main.object(forInfoDictionaryKey: Keys.Plist.apiKey) as? String {
            return apiKey
        }
        return ""
    }()
}
