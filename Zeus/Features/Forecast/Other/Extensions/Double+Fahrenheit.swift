//
//  Double+Fahrenheit.swift
//  Zeus
//
//  Created by Paul Matar on 28/08/2023.
//

import Foundation

extension Double {
    var celsiusToFahrenheit: Double {
        (self * 9.0 / 5.0) + 32.0
    }
}
