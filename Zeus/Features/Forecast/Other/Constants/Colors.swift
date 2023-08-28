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
    
    class var metalBlack: UIColor {
        .init(named: "metalBlack") ?? .black
    }
    
    class var berlin: UIColor {
        .init(named: "berlin") ?? .darkGray
    }
    
    class var monday: UIColor {
        .init(named: "monday") ?? .gray
    }
    
    class var bg: UIColor {
        .init(named: "bg") ?? .gray
    }
}
