//
//  ForecastRemote.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

struct ForecastRemote: Codable {
    let forecastday: [ForecastdayRemote]
}
