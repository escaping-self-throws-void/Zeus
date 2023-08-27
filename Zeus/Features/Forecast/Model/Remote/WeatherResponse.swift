//
//  WeatherResponse.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

struct WeatherResponse: Codable {
    let list: [ListRemote]
    let city: CityRemote
    
    var toDomain: Forecast {
        Forecast(
            list: list.map { $0.toDomain },
            city: city.toDomain
        )
    }
}
