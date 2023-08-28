//
//  Colors.swift
//  Zeus
//
//  Created by Paul Matar on 28/08/2023.
//

import UIKit

public extension UIColor {
    class var metalGray: UIColor {
        .init(named: "metalGray") ?? .gray
    }
    
    class var metalTeal: UIColor {
        .init(named: "metalTeal") ?? .systemTeal
    }
}
