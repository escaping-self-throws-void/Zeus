//
//  ListRemote.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

struct ListRemote: Codable {
    let dt: Double
    let main: TempRemote
    let weather: [WeatherRemote]
    let wind: WindRemote
    
    var toDomain: List {
        List(
            dt: dt,
            speed: wind.speed
        )
    }
}
