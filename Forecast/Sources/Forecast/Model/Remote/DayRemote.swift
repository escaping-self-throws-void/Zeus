//
//  DayRemote.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

struct DayRemote: Codable {
    let maxtempC, maxtempF, mintempC, mintempF: Double
    let avgtempC, avgtempF, maxwindMph: Double
    let maxwindKph: Double
    let condition: ConditionRemote

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case condition
    }
}
