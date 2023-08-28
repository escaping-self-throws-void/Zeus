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
    private var realmService: RealmService
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
            realmService.save(result)
        }
        return result
    }
    
    func fetchSavedWeather() -> Weather? {
        let result = realmService.readAll()
        latestFetched = result
        return result
    }
    
    func fetchLatest() -> Weather? {
        latestFetched
    }
}
