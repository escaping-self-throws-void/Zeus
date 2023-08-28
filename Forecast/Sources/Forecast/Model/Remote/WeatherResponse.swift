//
//  WeatherResponse.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

struct WeatherResponse: Codable {
    let location: LocationRemote
    let current: CurrentRemote
    let forecast: ForecastRemote
}
