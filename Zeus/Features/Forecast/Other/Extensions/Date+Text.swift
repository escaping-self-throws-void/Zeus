//
//  Date+Text.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

extension Date {
    var toWeekday: String {
        DateFormatter.current.dateFormat = "E"
        return DateFormatter.current.string(from: self)
    }
    
    var toWeekdayAndTime: String {
        DateFormatter.current.dateFormat = "E, h:mma"
        return DateFormatter.current.string(from: self)
    }
}
