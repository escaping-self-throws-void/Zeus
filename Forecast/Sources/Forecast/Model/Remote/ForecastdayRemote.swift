//
//  ForecastdayRemote.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

struct ForecastdayRemote: Codable {
    let date: String
    let dateEpoch: Int
    let day: DayRemote
    
    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day
    }
}
