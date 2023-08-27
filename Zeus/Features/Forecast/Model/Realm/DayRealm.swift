//
//  DayRealm.swift
//  Zeus
//
//  Created by Paul Matar on 28/08/2023.
//

import Foundation
import RealmSwift

class DayRealm: Object {
    @Persisted var date: Date = .init()
    @Persisted var icon: Int = 0
    @Persisted var minTemp: Double = 0.0
    @Persisted var maxTemp: Double = 0.0
}
