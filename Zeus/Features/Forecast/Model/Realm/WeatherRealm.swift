//
//  WeatherRealm.swift
//  Zeus
//
//  Created by Paul Matar on 28/08/2023.
//

import Foundation
import RealmSwift

class WeatherRealm: Object {
    @Persisted var animation: String = ""
    @Persisted var city: String = ""
    @Persisted var date: Date = .init()
    @Persisted var temp: Double = 0.0
    @Persisted var forecast = List<DayRealm>()
}
