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
    @Injected(.global)
    private var realmService: RealmService
    @Injected
    private var mapper: WeatherMapper
    
    public init() {}
    
    func fetchWeather(with query: String) async throws -> Weather {
        let request = ForecastRequest.forecast(query: query)
        let data: WeatherResponse = try await network.perform(request)
        let result = mapper.map(data)
        await MainActor.run {
            realmService.save(result)
        }
        return result
    }

    func fetchSavedWeather() -> Weather? {
        return realmService.readAll()
    }
}
