//
//  ForecastRepository.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation
import Network
import Core

public final class ForecastRepository {
    @Injected(.global)
    private var network: Networking
    @Injected(.global)
    private var storage: WeatherStorage
    @Injected
    private var mapper: WeatherMapper
    private var latestFetched: Weather?
}

// MARK: - Public methods
extension ForecastRepository {
    func fetchWeather(with query: String) async throws -> Weather {
        let request = ForecastRequest.forecast(query: query)
        let data: WeatherResponse = try await network.perform(request)
        let result = mapper.map(data)
        latestFetched = result
        await MainActor.run {
            storage.save(result)
        }
        return result
    }
    
    func fetchSavedWeather() -> Weather? {
        let result = storage.fetch()
        latestFetched = result
        return result
    }
    
    func fetchLatest() -> Weather? {
        latestFetched
    }
}
