//
//  CityRemote.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

struct CityRemote: Codable {
    let id: Int
    let name: String
    let country: String
    
    var toDomain: City {
        City(
            id: id,
            name: name,
            country: country
        )
    }
}
