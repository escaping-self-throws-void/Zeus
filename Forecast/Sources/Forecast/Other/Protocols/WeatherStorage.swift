//
//  WeatherStorage.swift
//  
//
//  Created by Paul Matar on 11/09/2023.
//

import Foundation

protocol WeatherStorage {
    func save(_ object: Weather)
    func fetch() -> Weather?
}
