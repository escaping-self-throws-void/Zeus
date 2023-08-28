//
//  DateFormatter+Current.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

public extension DateFormatter {
    static let current: DateFormatter = {
        let dateFormatter = DateFormatter()
        return dateFormatter
    }()
}
