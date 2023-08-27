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
    @Injected
    private var mapper: WeatherMapper
    
    public init() {}
    
    func get() async throws -> Weather {
        let data = try await fetch()
        return mapper.map(data)
    }
    
    private func fetch() async throws -> WeatherResponse {
        let request = ForecastRequest.forecast(query: "Beirut")
        let data: WeatherResponse = try await network.perform(request)
        return data
    }
}
