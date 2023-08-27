//
//  CurrentRemote.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

struct CurrentRemote: Codable {
    let tempC: Double
    let tempF: Double
    let condition: ConditionRemote
    let windMph: Double
    let windKph: Double
    
    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case tempF = "temp_f"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
    }
}
