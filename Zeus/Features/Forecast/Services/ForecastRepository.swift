//
//  ForecastRepository.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

public struct ForecastRepository {
    @Injected(.global)
    private var network: Networking
    
    public init() {}
    
    public func get() async throws -> Forecast {
        return try await fetch().toDomain
    }
    
    private func fetch() async throws -> WeatherResponse {
        let request = ForecastRequest.daily(lat: 44.34, lon: 10.99)
        let data: WeatherResponse = try await network.perform(request)
        return data
    }
}
