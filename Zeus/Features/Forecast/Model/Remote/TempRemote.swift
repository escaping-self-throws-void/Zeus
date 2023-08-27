//
//  TempRemote.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

struct TempRemote: Codable {
    let temp: Double
    let tempMin: Double
    let tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
