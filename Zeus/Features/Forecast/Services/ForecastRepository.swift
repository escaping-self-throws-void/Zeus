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
    
    func get() async throws -> [DayRemote] {
        let data = try await fetch()
        return data.forecast.forecastday.map { $0.day }
    }
    
    private func fetch() async throws -> WeatherResponse {
        let request = ForecastRequest.forecast(query: "44.34,10.99", days: 1)
        let data: WeatherResponse = try await network.perform(request)
        return data
    }
}
